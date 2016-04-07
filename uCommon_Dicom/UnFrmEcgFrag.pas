unit UnFrmEcgFrag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Dicom_Cmn, DCM_Attributes, DCM_Client, StdCtrls, ComCtrls,
  dxSkinsCore, dxSkinBlack, Medotrade, dxSkinOffice2007Green, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, Buttons, Menus,
  cxLookAndFeelPainters, cxButtons, dxSkinOffice2007Black;

type t_FragPnt = record
  P_val,
  P_x,
  p_y : integer;
end;

type
  TFrmEcgFrag = class(TForm)
    scrBox: TScrollBox;
    img1: TImage;
    Panel1: TPanel;
    CnsDMTable1: TCnsDMTable;
    Label1: TLabel;
    seZoomVert: TcxSpinEdit;
    seZoomHoriz: TcxSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    seHPix: TcxSpinEdit;
    cbP: TcxButton;
    cbQ: TcxButton;
    cbS: TcxButton;
    cbR: TcxButton;
    cbT: TcxButton;
    cbOtrezok: TcxButton;
    cbUgol: TcxButton;
    cxButton8: TcxButton;
    cbPR: TcxButton;
    cbPRs: TcxButton;
    cbQRS: TcxButton;
    cbSTs: TcxButton;
    cbQT: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure seZoomVertPropertiesChange(Sender: TObject);
    procedure seZoomHorizPropertiesChange(Sender: TObject);
    procedure seHPixPropertiesChange(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cbOtrezokClick(Sender: TObject);
    procedure cbUgolClick(Sender: TObject);
    procedure cbPClick(Sender: TObject);
    procedure cbQClick(Sender: TObject);
    procedure cbRClick(Sender: TObject);
    procedure cbSClick(Sender: TObject);
    procedure cbTClick(Sender: TObject);
    procedure cbPRClick(Sender: TObject);
    procedure cbPRsClick(Sender: TObject);
    procedure cbQRSClick(Sender: TObject);
    procedure cbQTClick(Sender: TObject);
    procedure cbSTsClick(Sender: TObject);
    procedure img1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
  private
  public
    vCurN,
    vPosI,
    vLPntiBeg  ,
    vLPnti1Beg ,
    vLPnti2Beg ,
    vLPntiEnd  ,
    vLPnti1End ,
    vLPnti2End : integer ;
    vKhoriz ,
    vKvert,
    vRejim : integer ;
    cArr : array of t_FragPnt;
    vUpd : Boolean;
    vS_height_channel_ECG,
    vSamplingFrequency : integer;
    v_FRGecg_acts      : array of t_ecg_actions;
    procedure ECGCalc;
    procedure setSize(pw,ph:integer);
    procedure ShRejBtn;
    procedure gtPosXY ( pX, pY : Integer; var P_i  : Integer );
    procedure risIzm;
  end;

const c_scrollBar = 20;
      c_koefIzm = 1.5;
      c_BtnCol  = clRed;

//var
 // FrmEcgFrag: TFrmEcgFrag;

implementation

{$R *.dfm}

uses fSnimki, Math;

procedure TFrmEcgFrag.ShRejBtn;
begin
  cbOtrezok.Colors.Normal:=clDefault;
  cbUgol.Colors.Normal:=clDefault;
  cbP.Colors.Normal:=clDefault;
  cbQ.Colors.Normal:=clDefault;
  cbR.Colors.Normal:=clDefault;
  cbS.Colors.Normal:=clDefault;
  cbT.Colors.Normal:=clDefault;
  cbPR.Colors.Normal:=clDefault;
  cbPRs.Colors.Normal:=clDefault;
  cbQRS.Colors.Normal:=clDefault;
  cbQT.Colors.Normal:=clDefault;
  cbSTs.Colors.Normal:=clDefault;
  if (vRejim=1) then begin   // ќтрезок
    cbOtrezok.Colors.Normal:=c_BtnCol;
  end else if (vRejim=2) then begin   // ”гол
    cbUgol.Colors.Normal:=c_BtnCol;
  end else if (vRejim=3) then begin   // P
    cbP.Colors.Normal:=c_BtnCol;
  end else if (vRejim=4) then begin   // Q
    cbQ.Colors.Normal:=c_BtnCol;
  end else if (vRejim=5) then begin   // R
    cbR.Colors.Normal:=c_BtnCol;
  end else if (vRejim=6) then begin   // S
    cbS.Colors.Normal:=c_BtnCol;
  end else if (vRejim=7) then begin   // T
    cbT.Colors.Normal:=c_BtnCol;
  end else if (vRejim=8) then begin   // PR int
    cbPR.Colors.Normal:=c_BtnCol;
  end else if (vRejim=9) then begin   // PR seg
    cbPRs.Colors.Normal:=c_BtnCol;
  end else if (vRejim=10) then begin  // QRS complex
    cbQRS.Colors.Normal:=c_BtnCol;
  end else if (vRejim=11) then begin  // QT int
    cbQT.Colors.Normal:=c_BtnCol;
  end else if (vRejim=12) then begin  // ST seg
    cbSTs.Colors.Normal:=c_BtnCol;
  end;

end;

procedure TFrmEcgFrag.seHPixPropertiesChange(Sender: TObject);
begin
  vS_height_channel_ECG := Trunc(seHPix.Value);
  if vUpd then
    ECGCalc;
end;

procedure TFrmEcgFrag.setSize(pw,ph:integer);
begin
  scrBox.Align:=alNone;
  scrBox.Width:=1;
  scrBox.Height:=1;
  Width  := pw;
  Height := ph;
  scrBox.Align:=alClient;
end;

procedure TFrmEcgFrag.seZoomHorizPropertiesChange(Sender: TObject);
begin
  vKhoriz := Trunc(seZoomHoriz.Value);
  if vUpd then
    ECGCalc;
end;

procedure TFrmEcgFrag.seZoomVertPropertiesChange(Sender: TObject);
begin
  vKvert := Trunc(seZoomVert.Value);
  if vUpd then
    ECGCalc;
end;

procedure TFrmEcgFrag.FormClose(Sender: TObject; var Action: TCloseAction);
var i:Integer;
begin
  SetLength(cArr,0);
  vFrgECG.Delete(vCurN);
end;

procedure TFrmEcgFrag.FormCreate(Sender: TObject);
begin
  SetLength(cArr,0);
  SetLength(v_FRGecg_acts,0);
  vUpd:=False;
  vRejim:=0;
end;

procedure TFrmEcgFrag.FormDestroy(Sender: TObject);
begin
  SetLength(v_FRGecg_acts,0);
  SetLength(cArr,0);
end;

// процедура определени€ позиции точки в массиве по координатам на TImage.Canvas
procedure TFrmEcgFrag.gtPosXY ( pX, pY : Integer; var P_i  : Integer );
var i,vBeg,vEnd:Integer; vDltInt:Boolean;
const cDelta = 5;
begin
  P_i:=-1; vDltInt:=False; vBeg:=-1; vEnd:=-1;
  for i := 0 to Length(cArr) - 1 do
    if ( ( Abs(cArr[i].P_x-pX)<=cDelta ) and
         ( Abs(cArr[i].p_y-pY)<=cDelta ) )
    then
    begin
      if not vDltInt then vBeg:=i;
      vEnd:=i;
      vDltInt:=True;
      P_i:=i;
    end else if vDltInt then Break;
  P_i:=Trunc((vBeg+vEnd)/2);
  Application.ProcessMessages;
end;

// отрисовка измерений
procedure TFrmEcgFrag.risIzm;
var i, vWidthPnt,viBeg,viEnd,vPosXBeg,vPosYBeg,valBeg,
    vPosXEnd,vPosYEnd,valEnd,
    vXTmp,vYTmp,vXsr,vYsr : Integer;
  procedure drawX ( x,y, Xwidth : integer );
  begin
    img1.Canvas.MoveTo( x-Xwidth, y );
    img1.Canvas.LineTo( x+Xwidth, y );
    img1.Canvas.MoveTo( x, y-Xwidth );
    img1.Canvas.LineTo( x, y+Xwidth );
  end;
  procedure cmnOtrezok;
  begin
    viBeg  := v_FRGecg_acts[i].vPntiBeg ;
    viEnd  := v_FRGecg_acts[i].vPntiEnd ;
    vPosXBeg := cArr[viBeg].P_x;
    vPosYBeg := cArr[viBeg].P_y;
    valBeg := cArr[viBeg].P_val;
    img1.Canvas.Brush.Color := clRed;
    img1.Canvas.Pen.Color   := clRed;
    img1.Canvas.Font.Color  := clRed;
    vWidthPnt := 4;
    drawX( vPosXBeg , vPosYBeg , vWidthPnt*2 );
    if viEnd<>-1 then
    begin
      vPosXEnd := cArr[viEnd].P_x;
      vPosYEnd := cArr[viEnd].P_y;
      valEnd := cArr[viEnd].P_val;
      img1.Canvas.MoveTo( vPosXBeg , vPosYBeg );
      img1.Canvas.LineTo( vPosXEnd , vPosYEnd );
      drawX( vPosXEnd , vPosYEnd, vWidthPnt*2 );
      //
      SetColor(img1, v_color_text_ECG);
      SetFontECG(img1);
      img1.Canvas.Brush.Color := clWhite;
      img1.Canvas.Pen.Color := clWhite;
      img1.Canvas.Font.Color := clBlack;
      img1.Canvas.Font.Size := 8;
      //
      vXTmp := Abs(vPosXEnd-vPosXBeg) ;
      vYTmp := Abs(vPosYEnd-vPosYBeg) ;
      vXsr:= Trunc( Min(vPosXBeg,vPosXEnd) + vXTmp/2 );
      vYsr:= Trunc( Min(vPosYBeg,vPosYEnd) + vYTmp/2 );
      //
      if (vSamplingFrequency>0) then
      begin
        img1.Canvas.TextOut( vXsr, vYsr+5, FloatToStr( RoundTo( 1000 * Abs(viEnd-viBeg)/vSamplingFrequency , -2 ) )+' мс' );   // по горизонтали: 1 сек - 5 клеток
        img1.Canvas.TextOut( vXsr, vYsr+20, FloatToStr( RoundTo( Abs(valEnd-valBeg)/1000 , -2 ) )+' мв' );        // по вертикали: 1 мв - 2 клетки        /(2*c_kletka)
      end else
        img1.Canvas.TextOut( vXsr, vYsr, 'UDF' );
    end;
  end;
  procedure cmnUgol;
  var vPosXBeg, vPosYBeg, vPosXEnd, vPosYEnd, valBeg,ValEnd,
      vPosXEnd1, vPosYEnd1, ValEnd1,
      viBeg, viEnd, viEnd1,
      vi1Beg, vi1End, vi1End1,
      vi2Beg, vi2End, vi2End1       : Integer;
      v1_2,v2_3,v3_1, vTmp1,
      vTmp2, vUgol : Extended;
  begin
    viBeg  := v_FRGecg_acts[i].vPntiBeg ;
    viEnd  := v_FRGecg_acts[i].vPntiEnd ;
    viEnd1  := v_FRGecg_acts[i].vPntiEnd1 ;
    vPosXBeg := cArr[viBeg].P_x;
    vPosYBeg := cArr[viBeg].P_y;
    valBeg := cArr[viBeg].P_val;
    img1.Canvas.Brush.Color := clRed;
    img1.Canvas.Brush.Style := bsSolid;
    img1.Canvas.Pen.Color   := clRed;
    img1.Canvas.Font.Color  := clRed;
    vWidthPnt := 4;
    drawX( vPosXBeg , vPosYBeg , vWidthPnt*2 );
    if ((viEnd<>-1) and (viEnd1=-1)) then  // втора€ точка
    begin
      vPosXEnd := cArr[viEnd].P_x;
      vPosYEnd := cArr[viEnd].P_y;
      img1.Canvas.MoveTo( vPosXBeg , vPosYBeg );
      img1.Canvas.LineTo( vPosXEnd , vPosYEnd );
      drawX( vPosXEnd , vPosYEnd, vWidthPnt*2 );
    end else if ((viEnd<>-1) and (viEnd1<>-1)) then          // треть€ точка
    begin
      vPosXEnd := cArr[viEnd].P_x;
      vPosYEnd := cArr[viEnd].P_y;
      img1.Canvas.MoveTo( vPosXBeg , vPosYBeg );
      img1.Canvas.LineTo( vPosXEnd , vPosYEnd );
      drawX( vPosXEnd , vPosYEnd, vWidthPnt*2 );
      vPosXEnd1 := cArr[viEnd1].P_x;
      vPosYEnd1 := cArr[viEnd1].P_y;
      img1.Canvas.MoveTo( vPosXEnd , vPosYEnd );
      img1.Canvas.LineTo( vPosXEnd1 , vPosYEnd1 );
      drawX( vPosXEnd1 , vPosYEnd1, vWidthPnt*2 );
      // определим угол : определ€етс€ угол до 180 градусов
      // 1. определим длину  сторон треугольника
      // v1_2,v2_3,v3_1,
      vTmp1 := Abs(vPosXEnd-vPosXBeg) ;
      vTmp2 := Abs(vPosYEnd-vPosYBeg) ;
      v1_2:= Sqrt(vTmp1*vTmp1+vTmp2*vTmp2);
      vTmp1 := Abs(vPosXEnd1-vPosXEnd) ;
      vTmp2 := Abs(vPosYEnd1-vPosYEnd) ;
      v2_3:= Sqrt(vTmp1*vTmp1+vTmp2*vTmp2);
      vTmp1 := Abs(vPosXBeg-vPosXEnd1) ;
      vTmp2 := Abs(vPosYBeg-vPosYEnd1) ;
      v3_1:= Sqrt(vTmp1*vTmp1+vTmp2*vTmp2);
      vUgol:=RoundTo( ArcCos((v1_2*v1_2+v2_3*v2_3-v3_1*v3_1)/(2*v1_2*v2_3)) / (Pi/180) , -2);
      //
      vXTmp := Abs(vPosXEnd-vPosXBeg) ;
      vYTmp := Abs(vPosYEnd-vPosYBeg) ;
      vXsr:= Trunc( Min(vPosXBeg,vPosXEnd) + vXTmp/2 );
      vYsr:= Trunc( Min(vPosYBeg,vPosYEnd) + vYTmp/2 );
      //
      SetColor(img1, v_color_text_ECG);
      SetFontECG(img1);
      img1.Canvas.Brush.Color := clWhite;
      img1.Canvas.Pen.Color := clWhite;
      img1.Canvas.Font.Color := clBlack;
      img1.Canvas.Font.Size := 8;
      //
      img1.Canvas.TextOut( vXsr, vYsr+5, FloatToStr( vUgol )+chr(176) );
    end;
    img1.Canvas.Brush.Style := bsClear ;
    img1.Canvas.Refresh;
  end;
  procedure FcmnPoint ( p_pr:integer );
  begin
    viBeg  := v_FRGecg_acts[i].vPntiBeg ;
    vPosXBeg := cArr[viBeg].P_x;
    vPosYBeg := cArr[viBeg].P_y;
    img1.Canvas.Brush.Color := clWhite;
    img1.Canvas.Pen.Color   := clBlack;
    img1.Canvas.Font.Color  := clBlack;
    vWidthPnt := 4;
    drawX( vPosXBeg , vPosYBeg , vWidthPnt*2 );
    if v_FRGecg_acts[i].r_type=3 then  // P
      img1.Canvas.TextOut( vPosXBeg , vPosYBeg-vWidthPnt*4, 'P' )
    else if v_FRGecg_acts[i].r_type=4 then  // Q
      img1.Canvas.TextOut( vPosXBeg , vPosYBeg-vWidthPnt*4, 'Q' )
    else if v_FRGecg_acts[i].r_type=5 then  // R
      img1.Canvas.TextOut( vPosXBeg , vPosYBeg-vWidthPnt*4, 'R' )
    else if v_FRGecg_acts[i].r_type=6 then  // S
      img1.Canvas.TextOut( vPosXBeg , vPosYBeg-vWidthPnt*4, 'S' )
    else if v_FRGecg_acts[i].r_type=7 then  // T
      img1.Canvas.TextOut( vPosXBeg , vPosYBeg-vWidthPnt*4, 'T' );
    img1.Canvas.Refresh;  
  end;
  procedure FcmnOtr ( p_pr:integer );
  var v_hh, vK : Integer;
  begin
    viBeg  := v_FRGecg_acts[i].vPntiBeg ;
    viEnd  := v_FRGecg_acts[i].vPntiEnd ;
    vPosXBeg := cArr[viBeg].P_x;
    vPosYBeg := cArr[viBeg].P_y;
    valBeg := cArr[viBeg].P_val;
    img1.Canvas.Brush.Color := clRed;
    img1.Canvas.Pen.Color   := clRed;
    img1.Canvas.Font.Color  := clRed;
    vWidthPnt := 4;
    drawX( vPosXBeg , vPosYBeg , vWidthPnt*2 );
    if viEnd<>-1 then
    begin
      vPosXEnd := cArr[viEnd].P_x;
      vPosYEnd := cArr[viEnd].P_y;
      valEnd := cArr[viEnd].P_val;
      img1.Canvas.MoveTo( vPosXBeg , vPosYBeg );
      if v_FRGecg_acts[i].r_type=8 then    // PR int
      begin
        vK:=-1;
        v_hh:=-90;
      end else if v_FRGecg_acts[i].r_type=9 then    // PR seg
      begin
        v_hh:=90;
        vK:=1;
      end else if v_FRGecg_acts[i].r_type=10 then   // QRS complex
      begin
        v_hh:=-180;
        vK:=-1;
      end else if v_FRGecg_acts[i].r_type=11 then   // QT int
      begin
        v_hh:=180;
        vK:=1;
      end else if v_FRGecg_acts[i].r_type=12 then   // ST seg
      begin
        v_hh:=-90;
        vK:=-1;
      end;
      img1.Canvas.LineTo( vPosXBeg , vPosYBeg + v_hh + vWidthPnt*2*vK );
      img1.Canvas.MoveTo( vPosXEnd , vPosYEnd  );
      img1.Canvas.LineTo( vPosXEnd , vPosYBeg + v_hh + vWidthPnt*2*vK );
      img1.Canvas.MoveTo( vPosXBeg , vPosYBeg + v_hh );
      img1.Canvas.LineTo( vPosXEnd , vPosYBeg + v_hh );
      drawX( vPosXEnd , vPosYEnd, vWidthPnt*2 );
      //
      SetColor(img1, v_color_text_ECG);
      SetFontECG(img1);
      img1.Canvas.Brush.Color := clWhite;
      img1.Canvas.Pen.Color := clWhite;
      img1.Canvas.Font.Color := clBlack;
      img1.Canvas.Font.Size := 8;
      //
      vXTmp := Abs(vPosXEnd-vPosXBeg) ;
      vYTmp := Abs(vPosYEnd-vPosYBeg) ;
      vXsr:= Trunc( Min(vPosXBeg,vPosXEnd) + vXTmp/2 );
      vYsr:= vPosYEnd + v_hh ;
      //
      if (vSamplingFrequency>0) then
      begin
        if v_FRGecg_acts[i].r_type=8 then    // PR int
          img1.Canvas.TextOut( vXsr, vYsr-15, 'PR интервал' )
        else if v_FRGecg_acts[i].r_type=9 then    // PR seg
          img1.Canvas.TextOut( vXsr, vYsr-15, 'PR сегмент' )
        else if v_FRGecg_acts[i].r_type=10 then   // QRS complex
          img1.Canvas.TextOut( vXsr, vYsr-15, 'комплекс QRS' )
        else if v_FRGecg_acts[i].r_type=11 then   // QT int
          img1.Canvas.TextOut( vXsr, vYsr-15, 'QT интервал' )
        else if v_FRGecg_acts[i].r_type=12 then   // ST seg
          img1.Canvas.TextOut( vXsr, vYsr-15, 'ST сегмент' );
        img1.Canvas.TextOut( vXsr, vYsr+5, FloatToStr( RoundTo( 1000 * Abs(viEnd-viBeg)/vSamplingFrequency , -2 ) )+' мс' );   // по горизонтали: 1 сек - 5 клеток
        img1.Canvas.TextOut( vXsr, vYsr+20, FloatToStr( RoundTo( Abs(valEnd-valBeg)/1000 , -2 ) )+' мв' );        // по вертикали: 1 мв - 2 клетки        /(2*c_kletka)
      end
      else
        img1.Canvas.TextOut( vXsr, vYsr, 'UDF' );
    end;
  end;
begin
  for I := 0 to Length(v_FRGecg_acts) - 1 do
  begin
    if v_FRGecg_acts[i].r_type=1 then       // отрезок - измерение рассто€ни€
    begin
      cmnOtrezok;
      img1.Canvas.Refresh;
    end else if v_FRGecg_acts[i].r_type=2 then       // ”гол
    begin
      cmnUgol;
      img1.Canvas.Refresh;
    end
    else if v_FRGecg_acts[i].r_type=3 then  // P
      FcmnPoint(v_FRGecg_acts[i].r_type)
    else if v_FRGecg_acts[i].r_type=4 then  // Q
      FcmnPoint(v_FRGecg_acts[i].r_type)
    else if v_FRGecg_acts[i].r_type=5 then  // R
      FcmnPoint(v_FRGecg_acts[i].r_type)
    else if v_FRGecg_acts[i].r_type=6 then  // S
      FcmnPoint(v_FRGecg_acts[i].r_type)
    else if v_FRGecg_acts[i].r_type=7 then  // T
      FcmnPoint(v_FRGecg_acts[i].r_type)
    else if v_FRGecg_acts[i].r_type=8 then    // PR int
      FcmnOtr(v_FRGecg_acts[i].r_type)
    else if v_FRGecg_acts[i].r_type=9 then    // PR seg
      FcmnOtr(v_FRGecg_acts[i].r_type)
    else if v_FRGecg_acts[i].r_type=10 then   // QRS complex
      FcmnOtr(v_FRGecg_acts[i].r_type)
    else if v_FRGecg_acts[i].r_type=11 then   // QT int
      FcmnOtr(v_FRGecg_acts[i].r_type)
    else if v_FRGecg_acts[i].r_type=12 then   // ST seg
      FcmnOtr(v_FRGecg_acts[i].r_type);

    Application.ProcessMessages;
  end;
end;

procedure TFrmEcgFrag.img1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var p_i,v_max,v_len:Integer;
  procedure cmnOtrezok;
  begin
    if ( (v_max=0)  or (v_FRGecg_acts[v_max-1].vPntiEnd <> -1) ) then
    begin
      v_len:=v_max+1;
      SetLength(v_FRGecg_acts,v_len);
      v_FRGecg_acts[v_len-1].r_type:=1;            // отрезок - измерение рассто€ни€
      v_FRGecg_acts[v_len-1].vPntiBeg  := p_i ;
      v_FRGecg_acts[v_len-1].vPntiEnd  := -1 ;
    end else if ( v_FRGecg_acts[v_max-1].vPntiEnd = -1 ) then
    begin
      v_FRGecg_acts[v_max-1].vPntiEnd  := P_i ;
      vRejim:=0 ;
      ShRejBtn;
    end;
  end;
  procedure cmnUgol;
  begin
    if ( (v_max=0) or (v_FRGecg_acts[v_max-1].vPntiEnd1 <> -1)  )
    then
    begin
      v_len:=v_max+1;
      SetLength(v_FRGecg_acts,v_len);
      v_FRGecg_acts[v_len-1].r_type:=2;            // угол
      v_FRGecg_acts[v_len-1].vPntiBeg  := p_i ;
      v_FRGecg_acts[v_len-1].vPntiEnd  := -1 ;
      v_FRGecg_acts[v_len-1].vPntiEnd1  := -1 ;
    end else if ( ( v_FRGecg_acts[v_max-1].vPntiEnd = -1 ) and
                  ( v_FRGecg_acts[v_max-1].vPntiEnd1 = -1 )
                )
    then
    begin
      v_FRGecg_acts[v_max-1].vPntiEnd  := P_i ;
      v_FRGecg_acts[v_max-1].vPntiEnd1  := -1 ;
    end else if ( ( v_FRGecg_acts[v_max-1].vPntiEnd <> -1 ) and
                  ( v_FRGecg_acts[v_max-1].vPntiEnd1 = -1 )
                )
    then
    begin
      v_FRGecg_acts[v_max-1].vPntiEnd1  := P_i ;
      vRejim:=0 ;
      ShRejBtn;
    end;
  end;
  procedure cmnPoint ( p_n :integer );
  begin
    v_len:=v_max+1;
    SetLength(v_FRGecg_acts,v_len);
    v_FRGecg_acts[v_len-1].r_type:=p_n;            // точка
    v_FRGecg_acts[v_len-1].vPntiBeg  := p_i ;
    vRejim:=0 ;
    ShRejBtn;
  end;
  procedure cmnOtr( p_n :integer );
  begin
    if ( (v_max=0)  or (v_FRGecg_acts[v_max-1].vPntiEnd <> -1) ) then
    begin
      v_len:=v_max+1;
      SetLength(v_FRGecg_acts,v_len);
      v_FRGecg_acts[v_len-1].r_type:=p_n;            // отрезок - измерение рассто€ни€
      v_FRGecg_acts[v_len-1].vPntiBeg  := p_i ;
      v_FRGecg_acts[v_len-1].vPntiEnd  := -1 ;
    end else if ( v_FRGecg_acts[v_max-1].vPntiEnd = -1 ) then
    begin
      v_FRGecg_acts[v_max-1].vPntiEnd  := P_i ;
      vRejim:=0 ;
      ShRejBtn;
    end;
  end;
begin  //
  // найдем точку
  gtPosXY(X, Y, p_i);
  if P_i=-1 then Exit;
  v_max:=Length(v_FRGecg_acts);
  if vRejim=1 then  // ќтрезок
    cmnOtrezok
  else if vRejim=2 then  // ”гол
    cmnUgol
  else if vRejim=3 then  // P
    cmnPoint(vRejim)
  else if vRejim=4 then  // Q
    cmnPoint(vRejim)
  else if vRejim=5 then  // R
    cmnPoint(vRejim)
  else if vRejim=6 then  // S
    cmnPoint(vRejim)
  else if vRejim=7 then  // T
    cmnPoint(vRejim)
  else if vRejim=8 then    // PR int
    cmnOtr(vRejim)
  else if vRejim=9 then    // PR seg
    cmnOtr(vRejim)
  else if vRejim=10 then   // QRS complex
    cmnOtr(vRejim)
  else if vRejim=11 then   // QT int
    cmnOtr(vRejim)
  else if vRejim=12 then   // ST seg
    cmnOtr(vRejim);

  risIzm;
end;

procedure TFrmEcgFrag.cbPRsClick(Sender: TObject);
begin // PR seg
  if vRejim=9 then
    vRejim:=0
  else
    vRejim:=9;
  ShRejBtn;
end;

procedure TFrmEcgFrag.cbQRSClick(Sender: TObject);
begin  // QRS complex
  if vRejim=10 then
    vRejim:=0
  else
    vRejim:=10;
  ShRejBtn;
end;

procedure TFrmEcgFrag.cbSTsClick(Sender: TObject);
begin  // ST seg
  if vRejim=12 then
    vRejim:=0
  else
    vRejim:=12;
  ShRejBtn;
end;

procedure TFrmEcgFrag.cbQTClick(Sender: TObject);
begin // QT int
  if vRejim=11 then
    vRejim:=0
  else
    vRejim:=11;
  ShRejBtn;
end;

procedure TFrmEcgFrag.cbPClick(Sender: TObject);
begin // P
  if vRejim=3 then
    vRejim:=0
  else
    vRejim:=3;
  ShRejBtn;
end;

procedure TFrmEcgFrag.cbQClick(Sender: TObject);
begin  // Q
  if vRejim=4 then
    vRejim:=0
  else
    vRejim:=4;
  ShRejBtn;
end;

procedure TFrmEcgFrag.cbSClick(Sender: TObject);
begin // S
  if vRejim=6 then
    vRejim:=0
  else
    vRejim:=6;
  ShRejBtn;
end;

procedure TFrmEcgFrag.cbRClick(Sender: TObject);
begin // R
  if vRejim=5 then
    vRejim:=0
  else
    vRejim:=5;
  ShRejBtn;
end;

procedure TFrmEcgFrag.cbTClick(Sender: TObject);
begin // T
  if vRejim=7 then
    vRejim:=0
  else
    vRejim:=7;
  ShRejBtn;
end;

procedure TFrmEcgFrag.cbOtrezokClick(Sender: TObject);
begin // ќтрезок
  if vRejim=1 then
    vRejim:=0
  else
    vRejim:=1;
  ShRejBtn;
end;

procedure TFrmEcgFrag.cbUgolClick(Sender: TObject);
begin // ”гол
  if vRejim=2 then
    vRejim:=0
  else
    vRejim:=2;
  ShRejBtn;
end;

procedure TFrmEcgFrag.cxButton8Click(Sender: TObject);
begin  // ”брать измерени€
  vRejim:=0;
  SetLength(v_FRGecg_acts,0);
  ShRejBtn;
  ECGCalc;
end;

procedure TFrmEcgFrag.cbPRClick(Sender: TObject);
begin // PR int
  if vRejim=8 then
    vRejim:=0
  else
    vRejim:=8;
  ShRejBtn;
end;

procedure TFrmEcgFrag.ECGCalc;
var v_WaveformData: TDicomWaveForm;
    v_min_val, v_max_val, v_cmn_amm, v_amm_pnt, v_max_pnt_in_group,
    v_SamplingFrequency, v_x_max, v_y_max, v_max, v_delta,
    i, x2,y2,i4, v_height, v_width, i1,i2, v_tmp,
    v_x_top, v_y_top, v_n_chnl, v_n_chnl1, p5, j,
    v_xx, v_yy, v_y_c, v_n_bg, ik, v_i,
    v_y1,v_y2, v_tmp1, v_tmp2, v_amm : Integer;
    v_dt, v_dt_max, v_dt_min : array of Integer;
    v_dt_sr : array of Extended;
    v_kx, v_ky, v_k_vert, v_k_horiz : extended;
    v_p1, v_p2, v_p3, v_step_const,
    v_py1, v_py2, v_py3, v_cur_pnt, v_step : integer;
    v_pr1,v_pr2,v_pr3 : boolean;
const c_delta_x = 150;
      c_delta_y = 50;
      c_LR_part = 20+c_delta_x; // крайние куски которые не рассматриваем
      c_delta = 100;
      cDeltaQS = 50;
  procedure SetWH ( p_width, p_height : integer );
  begin
    img1.Width  := p_width ;
    img1.Height  := p_height ;
    img1.Picture.Bitmap.Height:=img1.Height;
    img1.Picture.Bitmap.Width:=img1.Width;
  end;
var vColorOld : TColor;
    vStyleOld : TBrushStyle;
    vWidthPnt, v_len_tmp, i3, vPnt, vTmp,
    v_amm_points, vSrHeartBeats : Integer;
    vFontOld : TFont;
    v_millisec : Extended;
    v_dt_maxS, v_dt_minS, v_dtS : Integer;
    v_dt_srS : Extended;
const vDeltaPosQRS = 20;
begin // перерасчет и вывод фрагмента Ё √
  img1.Visible:=False;
  try
    img1.Height := 1000;
    img1.Width  := 5000;
    img1.Canvas.Brush.Color := v_color_fon_ECG;
    img1.Canvas.FillRect(Rect(0,0,img1.Width,img1.Height)); // заливка всей рабочей области
    img1.Canvas.Brush.Color := clBlack;
    img1.Canvas.Brush.Style := bsClear;
    v_k_vert  := 10/vKvert ;
    v_k_horiz := vKhoriz/25;
    v_height := Trunc(vS_height_channel_ECG/v_k_vert);     // /2* высота полоски
    v_width  := High(cArr);
    SetColor(img1, v_color_rzd_ECG);
    img1.Canvas.Pen.Width := v_size_line_rzd_ECG;
    img1.Canvas.Rectangle( 0,             // нарисуем границу
                           0,
                           Trunc(v_width*v_k_horiz),
                           v_height );
    x2:=0; p5:=0;
    while x2<img1.Width do // по оси абцисс
    begin
      Inc( x2, Trunc(c_kletka*v_k_horiz));
      Inc(p5);
      if ( p5 mod 5 )=0 then
        SetColor(img1, v_color_rzd_ECG)
      else
        SetColor(img1, v_color_rzd_grp_ECG );
      img1.Canvas.MoveTo( x2 , 0 );
      img1.Canvas.LineTo( x2 , v_height );
    end;
    v_y_c := Trunc( v_height/2 );
    img1.Canvas.MoveTo( 0 , v_y_c );
    SetColor(img1, v_color_rzd_ECG );
    img1.Canvas.LineTo( img1.Width , v_y_c );
    y2:=v_y_c; p5:=0;
    while y2<v_height do // рисуем разметку гориз линии вниз от центральной линии
    begin
      Inc(y2,Trunc(c_kletka/v_k_vert));
      Inc(p5);
      if ( p5 mod 2 )=0 then
        SetColor(img1, v_color_rzd_ECG )
      else
        SetColor(img1, v_color_rzd_grp_ECG ); // v_color_rzd_ECG + 2
      img1.Canvas.MoveTo( 0 , y2 );
      img1.Canvas.LineTo( img1.Width , y2 );
    end;
    y2:=v_y_c; p5:=0;
    while y2>0 do            // рисуем разметку гориз линии вверх от центральной линии
    begin
      y2:=y2-Trunc(c_kletka/v_k_vert);
      Inc(p5);
      if ( p5 mod 2 )=0 then
        SetColor(img1, v_color_rzd_ECG )
      else
        SetColor(img1, v_color_rzd_grp_ECG );
      img1.Canvas.MoveTo( 0 , y2 );
      img1.Canvas.LineTo( img1.Width , y2 );
    end;
    v_dt_maxS:=cArr[0].P_val; v_dt_minS:=cArr[0].P_val; v_dt_srS:=0;
    for i1 := 0 to High(cArr)-1 do
    begin
      if v_dt_maxS<cArr[i1].P_val then v_dt_maxS:=cArr[i1].P_val;
      if v_dt_minS>cArr[i1].P_val then v_dt_minS:=cArr[i1].P_val;
      v_dt_srS := v_dt_srS + cArr[i1].P_val/High(cArr);
    end;
    v_WaveformData := CnsDMTable1[0].Attributes.fWaveformData ;
    v_dtS:=cArr[0].P_val;
    for i1 := 0 to High(cArr)-1 do
    begin
      v_tmp := cArr[i1].P_val ;
      v_kx := (5*c_kletka) / v_WaveformData.v_data[vLPntiBeg].r_channel[vLPnti2Beg].r_SamplingFrequency ;
      v_kx := v_kx*v_k_horiz;
      v_ky := 0.001 * 2 * c_kletka ;
      v_ky := v_ky / v_k_vert ;
      v_tmp1    := Trunc( v_dtS - v_dt_srS ) ;
      v_tmp2    := Trunc( v_tmp - v_dt_srS ) ;
      if v_tmp1>0 then
        v_y1  := Trunc( 0  - v_height/2+(v_height-abs(v_tmp1) * v_ky) )
      else
        v_y1  := Trunc( 0  + (v_height/2+abs(v_tmp1) * v_ky) ) ;
      if v_tmp2>0 then
      begin
        v_y2  := Trunc( 0  - v_height/2+(v_height-abs(v_tmp2) * v_ky) );
      end else
      begin
        v_y2  := Trunc( 0  + (v_height/2+abs(v_tmp2) * v_ky) ) ;
      end;
      SetColor(img1, v_color_line_ECG );   // RGB( 151, 194, 240);  // clRed;
      img1.Canvas.Pen.Width := v_size_line_ECG ;
      img1.Canvas.MoveTo( Trunc( (i1-1)*v_kx ) , v_y1 );
      img1.Canvas.LineTo( Trunc( i1*v_kx )     , v_y2 );
      cArr[i1].P_x := Trunc( i1*v_kx ) ;
      cArr[i1].p_y := v_y2 ;
      cArr[i1].P_val := v_tmp ;
      v_dtS := v_tmp ;
      v_width:=Trunc( i1*v_kx );
    end;

    risIzm;
  finally
    img1.Height := v_height;
    img1.Width  := v_width;
    img1.Visible:=True;
  end;
end;

end.
