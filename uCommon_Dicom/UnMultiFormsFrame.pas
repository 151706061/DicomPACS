unit UnMultiFormsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DCM_Attributes, Dcm_View, StdCtrls, ExtCtrls,
  cxPC, DB, DCM_MemTable, Menus, dxSkinOffice2007Green, cxClasses, dxBar,
  cxLookAndFeelPainters, cxButtons, dxSkinsCore, dxSkinsdxBarPainter,
  UnFrmSize, dxSkinBlack, V3DRenWindow, ActnList, fSnimki, cxControls,
  cxSplitter, dxBarExtItems, dxBarExtDBItems, cxContainer, cxEdit, cxTrackBar,
  DICOM_CMN, DCM_Client, cxCheckGroup, cxBarEditItem, Medotrade, OleCtrls,
  SHDocVw, frxClass, frxVariables, cxColorComboBox, cxCheckBox, Buttons,
  dxSkinOffice2007Black, Registry;

type
  TMultiForms = class(TFrame)
    DicomMV: TDicomMultiViewer;
    CnsDMTable1: TCnsDMTable;
    dxBarManager1: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxbrsbtm1: TdxBarSubItem;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    bbScreen: TdxBarSubItem;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton18: TdxBarButton;
    BtnExit: TdxBarButton;
    dxBarManager1Bar2: TdxBar;
    dxBarButton19: TdxBarButton;
    dxBarSubItem5: TdxBarSubItem;
    dxBarSubItem6: TdxBarSubItem;
    dxBarSubItem7: TdxBarSubItem;
    dxBarButton21: TdxBarButton;
    dxBarButton22: TdxBarButton;
    dxBarButton20: TdxBarButton;
    dxBarButton9: TdxBarButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    dxBarDockControl2: TdxBarDockControl;
    dxBarManager1Bar1: TdxBar;
    BarOpenClose: TdxBarButton;
    bbHead: TdxBarButton;
    dxBarButton24: TdxBarButton;
    dxBarButton25: TdxBarButton;
    dxBarButton26: TdxBarButton;
    bbMPR: TdxBarButton;
    PresentationStateDS: TCnsDMTable;
    dxBarButton23: TdxBarButton;
    dxBarLookupCombo1: TdxBarLookupCombo;
    dxBarProgressItem1: TdxBarProgressItem;
    dxBarContainerItem1: TdxBarContainerItem;
    Timer1: TTimer;
    btnPlay: TdxBarButton;
    btnDirect: TdxBarButton;
    CnsDMTable2: TCnsDMTable;
    scrBox: TScrollBox;
    img1: TImage;
    dxBarSubItem3: TdxBarSubItem;
    dxBarSubItem8: TdxBarSubItem;
    cxBarEditItem1: TcxBarEditItem;
    ecg_vert_5: TdxBarButton;
    ecg_vert_10: TdxBarButton;
    ecg_vert_15: TdxBarButton;
    ecg_vert_20: TdxBarButton;
    ecg_vert_25: TdxBarButton;
    ecg_vert_40: TdxBarButton;
    ecg_vert_75: TdxBarButton;
    ecg_horiz_25: TdxBarButton;
    ecg_horiz_50: TdxBarButton;
    ecg_horiz_100: TdxBarButton;
    wbPDF: TWebBrowser;
    dxBarButton27: TdxBarButton;
    frxReport1: TfrxReport;
    dxBarButton28: TdxBarButton;
    dxBarSubItem9: TdxBarSubItem;
    dxBarColorCombo1: TdxBarColorCombo;
    dxBarColorCombo2: TdxBarColorCombo;
    dxBarColorCombo3: TdxBarColorCombo;
    dxBarColorCombo4: TdxBarColorCombo;
    dxBarFontNameCombo1: TdxBarFontNameCombo;
    dxBarSpinEdit1: TdxBarSpinEdit;
    cxBarEditItem2: TcxBarEditItem;
    cxBarEditItem3: TcxBarEditItem;
    dxBarColorCombo5: TdxBarColorCombo;
    dxBarSpinEdit2: TdxBarSpinEdit;
    dxBarSpinEdit3: TdxBarSpinEdit;
    ColorDialog1: TColorDialog;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    Panel4: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Panel5: TPanel;
    Shape2: TShape;
    Label2: TLabel;
    Panel6: TPanel;
    Shape3: TShape;
    Label3: TLabel;
    Panel7: TPanel;
    Shape4: TShape;
    Label4: TLabel;
    Panel8: TPanel;
    Shape5: TShape;
    Label5: TLabel;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    dxBarControlContainerItem3: TdxBarControlContainerItem;
    dxBarControlContainerItem4: TdxBarControlContainerItem;
    dxBarControlContainerItem5: TdxBarControlContainerItem;
    dxBarSpinEdit4: TdxBarSpinEdit;
    dxBarButton29: TdxBarButton;
    dxBarButton31: TdxBarButton;
    Panel9: TPanel;
    Shape6: TShape;
    Label6: TLabel;
    dxBarControlContainerItem6: TdxBarControlContainerItem;
    dxBarButton32: TdxBarButton;
    dxBarSubItem10: TdxBarSubItem;
    dxBarButton33: TdxBarButton;
    ecg_horiz_200: TdxBarButton;
    dxBarButton34: TdxBarButton;
    dxBarButton30: TdxBarButton;
    dxBarButton35: TdxBarButton;
    dxBarButton36: TdxBarButton;
    dxBarSubItem11: TdxBarSubItem;
    dxBarButton37: TdxBarButton;
    dxBarButton38: TdxBarButton;
    dxBarButton39: TdxBarButton;
    dxBarButton40: TdxBarButton;
    dxBarButton41: TdxBarButton;
    dxBarButton42: TdxBarButton;
    dxBarButton43: TdxBarButton;
    dxBarButton44: TdxBarButton;
    dxBarButton45: TdxBarButton;
    dxBarButton46: TdxBarButton;
    dxBarButton47: TdxBarButton;
    dxBarButton48: TdxBarButton;
    procedure DicomMVViewSelected(Sender: TObject);
    procedure DicomMVViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dxBarButton10Click(Sender: TObject);
    procedure dxBarButton11Click(Sender: TObject);
    procedure dxBarButton12Click(Sender: TObject);
    procedure dxBarButton13Click(Sender: TObject);
    procedure dxBarButton14Click(Sender: TObject);
    procedure dxBarButton16Click(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure FrameConstrainedResize(Sender: TObject; var MinWidth, MinHeight,
      MaxWidth, MaxHeight: Integer);
    procedure dxBarButton9Click(Sender: TObject);
    procedure BarOpenCloseClick(Sender: TObject);
    procedure bbHeadClick(Sender: TObject);
    procedure DicomMVAfterObjectMove(Sender: TObject;
      AObject: TDicomDrawObject);
    procedure DicomMVAfterObjectSize(Sender: TObject;
      AObject: TDicomDrawObject);
    procedure bbMPRClick(Sender: TObject);
    procedure DicomMVCreateDicomViewItem(Sender: TObject; const ARow,
      AColumn: Integer; var AItem: TCustomDicomImage);
    procedure DicomMVAfterNewDrawObject(Sender: TObject;
      AObject: TDicomDrawObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnDirectClick(Sender: TObject);
    procedure DicomMVCurrentImageTo(Sender: TObject; AOldIndex,
      ANewIndex: Integer);
    procedure ecg_vert_5Click(Sender: TObject);
    procedure ecg_vert_10Click(Sender: TObject);
    procedure ecg_vert_15Click(Sender: TObject);
    procedure ecg_vert_20Click(Sender: TObject);
    procedure ecg_vert_25Click(Sender: TObject);
    procedure ecg_vert_40Click(Sender: TObject);
    procedure ecg_vert_75Click(Sender: TObject);
    procedure ecg_horiz_25Click(Sender: TObject);
    procedure ecg_horiz_50Click(Sender: TObject);
    procedure ecg_horiz_100Click(Sender: TObject);
    procedure img1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dxBarButton27Click(Sender: TObject);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    procedure dxBarButton28Click(Sender: TObject);
    procedure dxBarColorCombo5Change(Sender: TObject);
    procedure dxBarColorCombo2Change(Sender: TObject);
    procedure dxBarColorCombo3Change(Sender: TObject);
    procedure dxBarColorCombo4Change(Sender: TObject);
    procedure dxBarFontNameCombo1Change(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label1Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Shape2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label3Click(Sender: TObject);
    procedure Shape3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel6Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Shape4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label5Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure dxBarSpinEdit2ButtonClick(Sender: TdxBarSpinEdit;
      Button: TdxBarSpinEditButton);
    procedure dxBarSpinEdit3ButtonClick(Sender: TdxBarSpinEdit;
      Button: TdxBarSpinEditButton);
    procedure dxBarSpinEdit1ButtonClick(Sender: TdxBarSpinEdit;
      Button: TdxBarSpinEditButton);
    procedure cxBarEditItem2PropertiesChange(Sender: TObject);
    procedure cxBarEditItem3PropertiesChange(Sender: TObject);
    procedure dxBarSpinEdit4ButtonClick(Sender: TdxBarSpinEdit;
      Button: TdxBarSpinEditButton);
    procedure dxBarButton31Click(Sender: TObject);
    procedure Shape6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label6Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure dxBarButton32Click(Sender: TObject);
    procedure ecg_horiz_200Click(Sender: TObject);
    procedure dxBarButton33Click(Sender: TObject);
    procedure dxBarButton34Click(Sender: TObject);
    procedure dxBarButton30Click(Sender: TObject);
    procedure dxBarButton29Click(Sender: TObject);
    procedure dxBarButton35Click(Sender: TObject);
    procedure dxBarButton37Click(Sender: TObject);
    procedure dxBarButton38Click(Sender: TObject);
    procedure dxBarButton39Click(Sender: TObject);
    procedure dxBarButton42Click(Sender: TObject);
    procedure dxBarButton43Click(Sender: TObject);
    procedure dxBarButton45Click(Sender: TObject);
    procedure dxBarButton46Click(Sender: TObject);
    procedure dxBarButton47Click(Sender: TObject);
    procedure dxBarButton48Click(Sender: TObject);
  public
    vMyECGPage : Integer;                    // счетчик для нумерации страниц при печати ЭКГ
    // уровень главной формы
    vp_CnsDMTablePID: TCnsDMTable;           // CnsDMTable для пациента(закладки) PID
    vp_tabsheet: TMyTabSheet;                // tabsheet сверху
    vp_DCMMultiImage:TDCMMultiImage;         // DCMMultiImage для пациента
    vp_Panel : TPanel;                       // панель для DCMMultiImage
    vp_P_PID ,                               // пациент
    vp_StudyInstanceUID : string;            // STUDYUID
    v_top,v_left,v_width,v_Height :Integer;  // параметры формочки
    v_is_visible,                            // признак что формочка удалена - она всегда невидима
    v_is_full_screen,                        // признак что формочка развернута на весь экран
    v_is_hide,                               // признак что формочка временно невидима пока другая развернута на весь экран
    v_is_selected : Boolean;                 // признак что формочка выбрана кликом мыши
    v_R, v_G, v_B : Integer;                 // дефолтные цвета
    v_is_negative : Boolean;                 // признак негативного снимка
    v_is_xy : Boolean;                       // признак того, что указатель = координаты/плотность
    v_is_new : boolean;                      // признак новой формы - для добавления из файлов
    MyCineActive : boolean;                  // признак что запущено проигрывание видео
    MyCineDirection : boolean;               // признак проигрывания видео вперед (True)
    MyFCineLoop2    : boolean;
    v_timewrk1video : Cardinal;
    v_ecg_acts      : array of t_ecg_actions;
    v_koeff_horiz, v_koeff_vert : integer;   // коеффициент экг
    v_pdf_filename : AnsiString;
    v_SnimokModality : string;
    vScale : Single;

    procedure WMNCPaint ( const p_is_active:Boolean );
    procedure Set_Select(Sender: TObject);
    procedure frm_mrk;
    procedure set_kalibr;
    procedure Show_Video_Panel;
    procedure set_ECG_Zoom;
    procedure btnShapeIniColor;
    procedure cmn_color_fon_ECG;
    procedure cmn_color_rzd_ECG;
    procedure cmn_color_rzd_grp_ECG;
    procedure cmn_color_text_ECG;
    procedure cmn_color_line_ECG;
    procedure cmn_otmetka_ECG;
    function gtKoefX:Integer;
    function gtKoefY:Integer;
    procedure pdxBarButtonDown(pdxBarButton:TdxBarButton; pDown:Boolean=True);
    procedure pFrmStructuredReportWebBrowserFrm ( das: TDicomDataset; pFileName:string; pWebPDF: TWebBrowser );
    function PreviewPDF : ansistring;
    procedure PreviewECG;
    function PreviewSR : ansistring;
    procedure PreviewCmn;
    function PreviewBeforeCmn : string;
    function CheckPDF : Boolean;
    procedure pZoom ( pZm : Boolean );
    procedure pMove ( pMm : Byte );
  end;

function gt_active_form : TMultiForms;
procedure FrmSnimkiRefr;
function clc_amm_frm : Integer;

const cPDFErr = 'Проверьте установку Adobe Acrobat Reader';
      cZm = 0.1;

implementation

Uses DCM_Dict, fHeader, MprUnit, Mpr3DUnit, DCM_MPR, UnKalibr, UnFrmEcgFrag,
     DCM_Connection, CmnUnit, DCM_UID, DCM32;

{$R *.dfm}

procedure TMultiForms.Timer1Timer(Sender: TObject);
var v_Attributes       : TDicomAttributes;
    v_CustomDicomImage : TCustomDicomImage;
    fCineSeriesUID     : string;
    v_cur_instance,
    v_FrameCount       : integer;
    Wd : HWnd; i:Integer;
begin // проигрывание видео по таймеру
  v_cur_instance := DicomMV.CurrentImage; // CnsDMTable1.Currentindex ;
  if CnsDMTable1.Count<=0 then exit;  
  v_Attributes   := CnsDMTable1[v_cur_instance].Attributes;
  v_CustomDicomImage:=DicomMV.ActiveView;
  if not assigned(v_Attributes) then
    exit;
  v_FrameCount := v_Attributes.ImageData.FrameCount;
  if v_FrameCount<=1 then
    exit;
  fCineSeriesUID := v_Attributes.GetString(dSeriesInstanceUID);
  if not MyCineDirection then
  begin
    v_Attributes.ImageData.FrameIndex := v_Attributes.ImageData.FrameIndex + 1;
    if v_Attributes.ImageData.FrameIndex >= v_FrameCount - 1 then
       v_Attributes.ImageData.FrameIndex := 0;
  end
  else
  begin
    v_Attributes.ImageData.FrameIndex := v_Attributes.ImageData.FrameIndex - 1 ;
    if v_Attributes.ImageData.FrameIndex <= 0 then
      v_Attributes.ImageData.FrameIndex := v_FrameCount - 1;
  end;
  //
  v_CustomDicomImage.SetCurrentFrame(v_Attributes.ImageData.FrameIndex);
//  v_CustomDicomImage.fDrawCine.CurrentFrame := v_Attributes.ImageData.FrameIndex;

  //DicomMV.UpdateScrollBars;
  //if assigned(DicomMV.OnImageCineTo) then
  //    DicomMV.OnImageCineTo(DicomMV, v_Attributes.ImageData.FrameIndex);

  {
  tbSpeedVideo.Properties.Min:=1;
  tbSpeedVideo.Properties.Max:=v_FrameCount;
  tbSpeedVideo.Position := v_Attributes.ImageData.FrameIndex;
  tbSpeedVideo.Update;
  tbSpeedVideo.Refresh; }

  DicomMV.Refresh;
  
  v_timewrk1video := GetTickCount - v_timewrk1video;
 { if 40 - v_timewrk1video>5 then
  begin
    Timer1.Enabled :=False;
    Timer1.Interval := 40 - v_timewrk1video;
    Timer1.Enabled :=True;
  end; }

  i:=0;
  while i<3 do
  begin
    Inc(i);
    Wd:=FindWindow(0,'JPEG Library Error');
    if (Wd<>0) then
      SendMessage( Wd, WM_CLOSE, 0,0)
    else Break;  
  end;

 // Application.ProcessMessages;
  //
end;

procedure TMultiForms.Show_Video_Panel;
begin
  if CnsDMTable1.Count>0 then
  begin                        //     CnsDMTable1.Currentindex
    if CnsDMTable1[DicomMV.CurrentImage].Attributes.ImageData=nil then
    begin
      btnPlay.Visible   := ivNever;
      btnDirect.Visible := ivNever;
    end else if ( CnsDMTable1[DicomMV.CurrentImage].Attributes.ImageData.FrameCount>1 ) then
    begin
      btnPlay.Visible   := ivAlways;
      btnDirect.Visible := ivAlways;
    end else
    begin
      btnPlay.Visible   := ivNever;
      btnDirect.Visible := ivNever;
    end;
  end else
  begin
    btnPlay.Visible   := ivNever; 
    btnDirect.Visible := ivNever;
  end;
end;

procedure cmn_frm_mrk ( p_TObject : TMultiForms);
begin
  p_TObject.Set_Select(p_TObject.DicomMV);
  p_TObject.DicomMV.ActiveView.SetFocus;
  p_TObject.WMNCPaint(True);
end;

procedure TMultiForms.frm_mrk;
begin
  cmn_frm_mrk(Self);
end;

procedure TMultiForms.frxReport1GetValue(const VarName: string;
  var Value: Variant);
begin
  if CompareText(VarName, 'dPatientName') = 0 then             // CnsDMTable1[0].Attributes.getString($20, $E)
   Value := CnsDMTable1[DicomMV.CurrentImage].Attributes.getString(dPatientName)
  else if CompareText(VarName, 'dPatientSex') = 0 then
    if Trim(CnsDMTable1[DicomMV.CurrentImage].Attributes.getString(dPatientSex))='' then
      Value := '___'
    else
      Value := CnsDMTable1[DicomMV.CurrentImage].Attributes.getString(dPatientSex)
  else if CompareText(VarName, 'dPatientBirthDate') = 0 then
    if Trim(CnsDMTable1[DicomMV.CurrentImage].Attributes.getString(dPatientBirthDate))='' then
      Value := '____/____/________'
    else
      Value := CnsDMTable1[DicomMV.CurrentImage].Attributes.getString(dPatientBirthDate)
  else if CompareText(VarName, 'dStudyDate') = 0 then
    if Trim(CnsDMTable1[DicomMV.CurrentImage].Attributes.getString(dStudyDate))='' then
      Value := '____/____/________'
    else
      Value := CnsDMTable1[DicomMV.CurrentImage].Attributes.getString(dStudyDate)
  else if CompareText(VarName, 'dPage') = 0 then
    Value := IntToStr(vMyECGPage);
end;

function TMultiForms.gtKoefX:Integer;
begin
  if ecg_horiz_25.Down then       Result:=25
  else if ecg_horiz_50.Down then  Result:=50
  else if ecg_horiz_100.Down then Result:=100
  else if ecg_horiz_200.Down then Result:=200
  else Result:=1;
end;

function TMultiForms.gtKoefY:Integer;
begin
  if ecg_vert_5.Down then       Result := 5
  else if ecg_vert_10.Down then Result := 10
  else if ecg_vert_15.Down then Result := 15
  else if ecg_vert_20.Down then Result := 20
  else if ecg_vert_25.Down then Result := 25
  else if ecg_vert_40.Down then Result := 40
  else if ecg_vert_75.Down then Result := 75
  else Result:=1;
end;

procedure TMultiForms.img1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var v_len, v_max : Integer; vX,vY : Extended;
    P_i, pi1, pi2 : integer;
  procedure cmnOtrezok;
  begin
    if ( (v_max=0)  or (v_ecg_acts[v_max-1].vPntiEnd <> -1) ) then
    begin
      v_len:=v_max+1;
      SetLength(v_ecg_acts,v_len);
      v_ecg_acts[v_len-1].r_type:=1;            // отрезок - измерение расстояния
      v_ecg_acts[v_len-1].vPntiBeg  := p_i ;
      v_ecg_acts[v_len-1].vPnti1Beg := pi1 ;
      v_ecg_acts[v_len-1].vPnti2Beg := pi2 ;
      v_ecg_acts[v_len-1].vPntiEnd  := -1 ;
      v_ecg_acts[v_len-1].vPnti1End := -1 ;
      v_ecg_acts[v_len-1].vPnti2End := -1 ;
    end else if ( v_ecg_acts[v_max-1].vPntiEnd = -1 ) then
    begin
      v_ecg_acts[v_max-1].vPntiEnd  := P_i ;
      v_ecg_acts[v_max-1].vPnti1End := Pi1 ;
      v_ecg_acts[v_max-1].vPnti2End := Pi2 ;
      pdxBarButtonDown(dxBarButton33,False);
    end;
  end;
  procedure cmnUgol;
  begin
    if ( (v_max=0) or (v_ecg_acts[v_max-1].vPntiEnd1 <> -1)  )
    then
    begin
      v_len:=v_max+1;
      SetLength(v_ecg_acts,v_len);
      v_ecg_acts[v_len-1].r_type:=2;            // угол
      v_ecg_acts[v_len-1].vPntiBeg  := p_i ;
      v_ecg_acts[v_len-1].vPnti1Beg := pi1 ;
      v_ecg_acts[v_len-1].vPnti2Beg := pi2 ;
      v_ecg_acts[v_len-1].vPntiEnd  := -1 ;
      v_ecg_acts[v_len-1].vPnti1End := -1 ;
      v_ecg_acts[v_len-1].vPnti2End := -1 ;
      v_ecg_acts[v_len-1].vPntiEnd1  := -1 ;
      v_ecg_acts[v_len-1].vPnti1End1 := -1 ;
      v_ecg_acts[v_len-1].vPnti2End1 := -1 ;
    end else if ( ( v_ecg_acts[v_max-1].vPntiEnd = -1 ) and
                  ( v_ecg_acts[v_max-1].vPntiEnd1 = -1 )
                )
    then
    begin
      v_ecg_acts[v_max-1].vPntiEnd  := P_i ;
      v_ecg_acts[v_max-1].vPnti1End := Pi1 ;
      v_ecg_acts[v_max-1].vPnti2End := Pi2 ;
      v_ecg_acts[v_max-1].vPntiEnd1  := -1 ;
      v_ecg_acts[v_max-1].vPnti1End1 := -1 ;
      v_ecg_acts[v_max-1].vPnti2End1 := -1 ;
    end else if ( ( v_ecg_acts[v_max-1].vPntiEnd <> -1 ) and
                  ( v_ecg_acts[v_max-1].vPntiEnd1 = -1 )
                )
    then
    begin
      v_ecg_acts[v_max-1].vPntiEnd1  := P_i ;
      v_ecg_acts[v_max-1].vPnti1End1 := Pi1 ;
      v_ecg_acts[v_max-1].vPnti2End1 := Pi2 ;
      pdxBarButtonDown(dxBarButton30,False);
    end;
  end;
  procedure cmnOtmetka;
  begin
    if ( (v_max=0)  or (v_ecg_acts[v_max-1].vPntiEnd <> -1) ) then
    begin
      v_len:=v_max+1;
      SetLength(v_ecg_acts,v_len);
      v_ecg_acts[v_len-1].r_type:=0;            // Отметка
      v_ecg_acts[v_len-1].vPntiBeg  := p_i ;
      v_ecg_acts[v_len-1].vPnti1Beg := pi1 ;
      v_ecg_acts[v_len-1].vPnti2Beg := pi2 ;
      v_ecg_acts[v_len-1].vPntiEnd  := -1 ;
      v_ecg_acts[v_len-1].vPnti1End := -1 ;
      v_ecg_acts[v_len-1].vPnti2End := -1 ;

    end else if ( v_ecg_acts[v_max-1].vPntiEnd = -1 ) then
    begin
      v_ecg_acts[v_max-1].vPntiEnd  := P_i ;
      v_ecg_acts[v_max-1].vPnti1End := Pi1 ;
      v_ecg_acts[v_max-1].vPnti2End := Pi2 ;
      pdxBarButtonDown(dxBarButton29,False);
    end;
  end;
begin  // down
  v_max:=Length(v_ecg_acts);
  gtPosXY ( CnsDMTable1[DicomMV.CurrentImage].Attributes.fWaveformData,
            X, Y, P_i, pi1, pi2  );
  if P_i=-1 then Exit;
  if dxBarButton33.Down then  // отрезок - измерение расстояния
  begin
    cmnOtrezok;
  end else if dxBarButton29.Down then // Отметка
  begin
    cmnOtmetka;
  end else if dxBarButton30.Down then // Угол
  begin
    cmnUgol;
  end;                      
  risIzm ( CnsDMTable1[DicomMV.CurrentImage].Attributes.fWaveformData, img1, v_ecg_acts, v_koeff_horiz, v_koeff_vert );
end;

procedure TMultiForms.set_kalibr;
var das0 : TDicomAttributes;
    da1: TDicomAttribute;
    v_DO : TDicomDrawObject;
    v_len, v_x, v_y, v_scale : Extended;
    v_seria : string;
    i : integer;
  procedure Snimok_klbr ( i : integer );
  begin
    // установить параметры для снимка
    das0 := DicomMV.DicomDatasets.Item[i].Attributes;
    da1 := das0.Add($28, $30);
    da1.AsFloat[0] := v_scale;
    da1.AsFloat[1] := v_scale;
    das0.Sort;
    DicomMV.DicomDatasets.Item[i].Attributes.ImageData.UpdateCood(da1.AsFloat[1],da1.AsFloat[0]);
  end;
begin
// найдем текущую PS
  if DicomMV.ActiveView.Attributes.ImageData.DrawObjects.NewDrawObject <> nil then
    begin
// определим длину в пикселях
      v_DO := DicomMV.ActiveView.Attributes.ImageData.DrawObjects.NewDrawObject;
      v_x  := abs(v_DO.X[0] - v_DO.X[1]);   // SCRX
      v_y  := abs(v_DO.Y[0] - v_DO.Y[1]);   // SCRY
      v_len:= Sqrt(v_x*v_x + v_y*v_y);
      Application.CreateForm(TfrmKalibr, frmKalibr);
      try
        frmKalibr.v_scale := DicomMV.DicomDatasets.Item[DicomMV.ActiveView.AttributesIndex].Attributes.ImageData.PixelSpacingY;
        frmKalibr.cxTextEdit1.Text := FloatToStr(frmKalibr.v_scale);
        frmKalibr.v_length_line := v_len;
        // вызвать форму для ввода параметров калибровки
        frmKalibr.ShowModal;
        if frmKalibr.ModalResult = mrOk then
          begin
            v_scale:=frmKalibr.v_scale/10;
            v_seria:=DicomMV.ActiveView.Attributes.GetString(dSeriesInstanceUID);
            if frmKalibr.cbToSeria.Checked then // применить ко все снимкам серии
            begin // калибровка снимков серии
              for i := 0 to DicomMV.DicomDatasets.Count - 1 do
              begin
                if ( DicomMV.DicomDatasets.Item[i].Attributes.GetString(dSeriesInstanceUID)=v_seria ) then
                  Snimok_klbr(i);
              end;
            end else
            begin // калибровка текущего снимка
              Snimok_klbr(DicomMV.ActiveView.AttributesIndex);
            end;
            DicomMV.DicomDatasets.Item[DicomMV.ActiveView.AttributesIndex].Attributes.ImageData.PixelSpacingY := da1.AsFloat[0] ;  //10
            DicomMV.DicomDatasets.Item[DicomMV.ActiveView.AttributesIndex].Attributes.ImageData.PixelSpacingX := da1.AsFloat[1] ; //10
            DicomMV.UpdateView;
            DicomMV.Update;
          end;
      finally
        frmKalibr.Free;
      end;
      // delete line
      DicomMV.ActiveView.Attributes.ImageData.DrawObjects.RemoveSelectedDrawObject;
    end else
    begin
      MessageDlg('Нет отмеченного измерения ', mtWarning, [mbOK], 0);
    end;
end;

function clc_amm_frm : Integer;
var i, v_amm : Integer;
begin
  v_amm:=0;
  for I := 0 to v_Snimki.Count - 1 do
  begin
    if (TWinControl(v_Snimki[i]) as TMultiForms).v_is_visible then
      Inc(v_amm);
  end;
  Result:=v_amm;
end;

procedure TMultiForms.Set_Select(Sender: TObject);
var i:Integer; v_EmpFrm:TMultiForms;
begin
  // цикл по всем окнам приложения и деактивация
  for I := 0 to fSnimki.v_forms_list.Count - 1 do
  begin
    v_EmpFrm:=(TWinControl(fSnimki.v_forms_list[i]) as TMultiForms);
    if v_EmpFrm.v_is_selected then
      v_EmpFrm.WMNCPaint(False);
  end;
  WMNCPaint(True);
  Self.DicomMV.ActiveView.SetFocus;
end;


procedure TMultiForms.DicomMVAfterNewDrawObject(Sender: TObject;
  AObject: TDicomDrawObject);
begin
  case AObject.Kind of
    ldmiRulerCalc:
      begin

      end;
    ldmiROI_Cycle, ldmiROI_Rect:
      begin
        DicomMV.ActiveView.LeaderMouserInspect := ldmiNone;
      end;
  else
    begin
      AObject.CalText := AObject.Calc2Text;
    end;
  end;
  DicomMV.ActiveView.LeaderMouserInspect := ldmiNone;
  DicomMVAfterObjectSize(Sender, AObject);
  // режим калибровки
  if frmSnimki.v_is_calibr then
    begin
      set_kalibr;
      frmSnimki.kb_ini;
    end;
end;

procedure TMultiForms.DicomMVAfterObjectMove(Sender: TObject;
  AObject: TDicomDrawObject);
var
  //  f1, f2: Double;
  das: TDicomAttributes;
  av, sd, ar: double;
begin
  das := TCustomDicomImage(Sender).Attributes;
  case AObject.Kind of
    ldmiROI_Cycle, ldmiROI_Rect:
      begin
        das.ImageData.CalAverage(Round(AObject.X[0]), Round(AObject.Y[0]), Round(AObject.X[1]),
          Round(AObject.Y[1]), av, sd, ar);
        AObject.CalText := Format('AV:%4.2f' + #13#10 + 'SD:%4.2f' + #13#10 + 'AR:%4.2f', [av, sd,
          ar]);
      end;
  end;  
end;

procedure TMultiForms.DicomMVAfterObjectSize(Sender: TObject;
  AObject: TDicomDrawObject);
var
  //  f1, f2: Double;
  das: TDicomAttributes;
  //  da1: TDicomAttribute;
  av, sd, ar: double;
begin
  das := TCustomDicomImage(Sender).Attributes;
  case AObject.Kind of

    ldmiROI_Cycle, ldmiROI_Rect:
      begin
        das.ImageData.CalAverage(Round(AObject.X[0]), Round(AObject.Y[0]), Round(AObject.X[1]),
          Round(AObject.Y[1]), av, sd, ar);
        AObject.CalText := Format('AV:%4.2f' + #13#10 + 'SD:%4.2f' + #13#10 + 'AR:%4.2f', [av, sd,
          ar]);
        if AObject.Name <> '' then
        begin
          //ExecuteSubroutine('SetMeasureValue', [AObject.Name, AObject.Tag, AV, sd, ar, AObject.RelateFrameIndex]);
        end;
      end;
    ldmiPolyonA:
      begin
        if AObject.Name <> '' then
        begin
          //ExecuteSubroutine('SetMeasureValue', [AObject.Name, AObject.Tag, AObject.CalcArea, AObject.CalcLength, 0, AObject.RelateFrameIndex]);
        end;
        AObject.CalText := AObject.Calc2Text;
      end;
    ldmiPolyonV:
      begin
        if AObject.Name <> '' then
        begin
          //ExecuteSubroutine('SetMeasureValue', [AObject.Name, AObject.Tag, AObject.CalcVolume, AObject.CalcLength, 0, AObject.RelateFrameIndex]);
        end;
        AObject.CalText := AObject.Calc2Text;
      end;
    ldmiAngle:
      begin
        if AObject.Name <> '' then
        begin
          //ExecuteSubroutine('SetMeasureValue', [AObject.Name, AObject.Tag, AObject.CalcAngle, 0, 0, AObject.RelateFrameIndex]);
        end;
        AObject.CalText := AObject.Calc2Text;
      end;
  else
    begin
      if AObject.Name <> '' then
      begin
        //ExecuteSubroutine('SetMeasureValue', [AObject.Name, AObject.Tag, AObject.CalcLength, 0, 0, AObject.RelateFrameIndex]);
      end;
      AObject.CalText := AObject.Calc2Text;
    end;
  end;
end;

procedure TMultiForms.DicomMVCreateDicomViewItem(Sender: TObject; const ARow,
  AColumn: Integer; var AItem: TCustomDicomImage);
begin
  AItem := TCns3DRenderWindow.Create(TComponent(Sender));
end;

procedure TMultiForms.DicomMVCurrentImageTo(Sender: TObject; AOldIndex,
  ANewIndex: Integer);
begin
  Show_Video_Panel;
end;

procedure TMultiForms.DicomMVViewDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var v_DMV : TWinControl;
    v_DMViewer : TDicomMultiViewer;
    v_MI : TDCMMultiImage;
    i, v_curr : integer;
    v_TCNSTableSRC : TCnsDMTable;
    v_StudyUID, v_P_PID : string;
begin // процедура обработки drag and drop
  v_DMV := (Sender as TWinControl);
  if ( (v_DMV.Parent is TDicomMultiViewer) and (Source is TDCMMultiImage) )
  then
  begin
    v_MI := (Source as TDCMMultiImage);
    v_DMViewer := (v_DMV.Parent as TDicomMultiViewer);
    v_TCNSTableSRC := ((v_DMViewer.Parent as TMultiForms).vp_CnsDMTablePID as TCnsDMTable);
    //
    v_curr := v_TCNSTableSRC.Currentindex;
    v_StudyUID:=v_TCNSTableSRC[v_curr].Attributes.GetString(dStudyInstanceUID);
    v_P_PID  :=v_TCNSTableSRC[v_curr].Attributes.GetString(dPatientID);
    //
    CnsDMTable1.ClearList;
    for I := 0 to v_TCNSTableSRC.Count - 1 do
    begin
      if (v_TCNSTableSRC[i].Attributes.GetString(dStudyInstanceUID)=v_StudyUID) then
      begin
        CnsDMTable1.Add(v_TCNSTableSRC.Item[i]);
      end;
    end;
    DicomMV.LimitOneSeries:=False;
    DicomMV.Update;
    Self.vp_CnsDMTablePID := v_TCNSTableSRC;        // CnsDMTable для пациента(закладки) PID
    Self.vp_DCMMultiImage := (v_MI as TDCMMultiImage);      // DCMMultiImage для пациента (закладки)
    Self.vp_Panel         := ((v_MI as TDCMMultiImage).Parent as TPanel);              // панель для DCMMultiImage
    Self.vp_P_PID         := v_P_PID;              // P_PID пациента
    Self.vp_StudyInstanceUID := v_StudyUID;           // STUDYUID
    Self.vp_tabsheet      := (((v_MI as TDCMMultiImage).Parent as TPanel).Parent as TMyTabSheet); // TabSheet
  end;
  frm_mrk;
  Show_Video_Panel;
end;

procedure TMultiForms.DicomMVViewSelected(Sender: TObject);
begin
  frm_mrk;
  frmSnimki.bbInvert.Down := v_is_negative;
  frmSnimki.bbTags.Down  := DicomMV.ActiveView.DisplayLabel;
  frmSnimki.bbRulers.Down  := DicomMV.ActiveView.DisplayRuler;
  frmSnimki.bbXY.Down := v_is_xy;
  // выполнение действия
  frmSnimki.p_action_frm;
//  SetFocus;
end;

procedure TMultiForms.dxBarButton10Click(Sender: TObject);
begin
  DicomMV.Rows := 1;
  DicomMV.Columns := 1;
end;

procedure TMultiForms.dxBarButton11Click(Sender: TObject);
begin
  DicomMV.Rows := 2;
  DicomMV.Columns := 1;
end;

procedure TMultiForms.dxBarButton12Click(Sender: TObject);
begin
  DicomMV.Rows := 1;
  DicomMV.Columns := 2;
end;

procedure TMultiForms.dxBarButton13Click(Sender: TObject);
begin
  DicomMV.Rows := 2;
  DicomMV.Columns := 2;
end;

procedure TMultiForms.dxBarButton14Click(Sender: TObject);
begin
  DicomMV.Rows := 2;
  DicomMV.Columns := 3;
end;

procedure TMultiForms.dxBarButton16Click(Sender: TObject);
begin
  DicomMV.Rows := 3;
  DicomMV.Columns := 3;
end;

procedure TMultiForms.dxBarButton27Click(Sender: TObject);
var v_WaveformData : TDicomWaveForm; v_b:Boolean;
    i, r_x_top , r_y_top , r_x_bottom ,
    r_y_bottom, v_len : Integer;
  function FrmCmnBitmap ( p_pictFRX:string ) : Boolean;
  var frPicture:TfrxPictureView; p_bmp: TBitmap; fPage:TfrxReportPage;
  begin
    Result:=False;
    p_bmp:= TBitmap.Create;
    try
      r_x_top    := v_WaveformData.v_ArrChnlImgBorder[i].r_x_top ;
      r_y_top    := v_WaveformData.v_ArrChnlImgBorder[i].r_y_top ;
      r_x_bottom := v_WaveformData.v_ArrChnlImgBorder[i].r_x_bottom ;
      r_y_bottom := v_WaveformData.v_ArrChnlImgBorder[i].r_y_bottom ;

      if (r_x_bottom-r_x_top)<10 then Exit;

      p_bmp.Width  := r_x_bottom-r_x_top ;
      p_bmp.Height := r_y_bottom-r_y_top ;
      p_bmp.Canvas.CopyRect( Rect( 0, 0, p_bmp.Width, p_bmp.Height ),
                               img1.Canvas,
                               Rect( r_x_top, r_y_top, r_x_bottom, r_y_bottom ));  // destination canvas source
      frPicture:= frxReport1.FindObject(p_pictFRX) as TfrxPictureView;
      if frPicture.Width<p_bmp.Width then
      begin
        fPage:=frxReport1.FindObject('Page1') as TfrxReportPage;
        fPage.PaperWidth:=Trunc(p_bmp.Width*0.048); // в пикселе 0.0264 мм
        frPicture.Width := p_bmp.Width;
      end;
      frPicture.Picture.Assign(p_bmp);
      if v_b then Result:=True
      else
        Result := ( (r_x_bottom-r_x_top-10) > frPicture.Width );
      Inc(i);
    finally
      p_bmp.Free;
    end;
  end;
begin // печать ЭКГ
  if ((v_koeff_vert<>10) or (v_koeff_horiz<>25)) then
  begin
    MessageDlg('Печать доступна при установленном разрешении'+#13+
               'по вертикали 10 мм/мв'+#13+
               'по горизонтали 25 мм/с', mtWarning, [mbOK], 0);
    Exit;
  end;
  v_WaveformData := CnsDMTable1[DicomMV.CurrentImage].Attributes.fWaveformData ;
  vMyECGPage:=1;
  i:=0; v_len:=Length(v_WaveformData.v_ArrChnlImgBorder);
  while i<=(v_len-1) do
  begin
    v_b:=False;
    v_b:=FrmCmnBitmap( 'Picture1' );
    if i<=(v_len-1) then
    begin
      v_b:=FrmCmnBitmap( 'Picture2' );
      if i<=(v_len-1) then
      begin
        v_b:=FrmCmnBitmap( 'Picture3' );
        if i<=(v_len-1) then
         v_b:=FrmCmnBitmap( 'Picture4' );
      end;
    end;
    frxReport1.ShowReport;
    Inc(vMyECGPage);
  end;
end;

procedure TMultiForms.dxBarButton28Click(Sender: TObject);
begin
  set_ECG_Zoom;
end;

procedure TMultiForms.dxBarButton31Click(Sender: TObject);
begin  // Установить по-умолчанию
  pIniEcgDrawParameters;
  set_ECG_Zoom;
end;

procedure TMultiForms.dxBarButton32Click(Sender: TObject);
begin
  set_ECG_Zoom;
end;

procedure TMultiForms.pdxBarButtonDown(pdxBarButton:TdxBarButton; pDown:Boolean=True);
begin
  pdxBarButton.AllowAllUp:=True;
  pdxBarButton.Down:=pDown;
  pdxBarButton.AllowAllUp:=False;
end;

procedure TMultiForms.dxBarButton29Click(Sender: TObject);
begin  // Отметка
  dxBarButton33.Down:=False;
  dxBarButton30.Down:=False;
end;

procedure TMultiForms.dxBarButton30Click(Sender: TObject);
begin // Угол
  pdxBarButtonDown(dxBarButton29,False);
  pdxBarButtonDown(dxBarButton33,False);
end;

procedure TMultiForms.dxBarButton33Click(Sender: TObject);
begin  // отрезок - измерение расстояния
  pdxBarButtonDown(dxBarButton29,False);
  pdxBarButtonDown(dxBarButton30,False);
end;

procedure TMultiForms.dxBarButton34Click(Sender: TObject);
begin // Убрать измерения
  pdxBarButtonDown(dxBarButton29,False);
  pdxBarButtonDown(dxBarButton33,False);
  pdxBarButtonDown(dxBarButton30,False);
  SetLength(v_ecg_acts,0);
  //
  set_ECG_Zoom;
end;

procedure TMultiForms.dxBarButton35Click(Sender: TObject);
var i, iFnd, j :integer;
    vFnd:Boolean;
    v_WaveformData: TDicomWaveForm;
    FrmEcgFrag: TFrmEcgFrag;
begin // Фрагмент
  vFnd:=False; iFnd:=-1;
  for I := 0 to Length(v_ecg_acts) - 1 do
    if v_ecg_acts[i].r_type=0 then  // Отметка
    begin
      vFnd:=True; iFnd:=i; Break;
    end;
  if not vFnd then
  begin
    MessageDlg('Нет отмеченной области', mtWarning, [mbOK], 0);
    Exit;
  end;
  // v_ecg_acts[v_len-1].r_type:=0;
  FrmEcgFrag                  := TFrmEcgFrag.Create(Self);
  Inc(vNFrgECG);
  FrmEcgFrag.Name             := 'ECG'+inttostr(vNFrgECG);
  vFrgECG.Add(FrmEcgFrag);
  FrmEcgFrag.vCurN := vFrgECG.Count-1;
  FrmEcgFrag.Caption := 'Фрагмент '+inttostr(vNFrgECG);
  FrmEcgFrag.Top:=100;
  FrmEcgFrag.Left:=100;
  FrmEcgFrag.img1.Top:=0;
  FrmEcgFrag.img1.Left:=0;
  //
  i := Length(v_ecg_acts) - 1 ;
  while i>=0 do
  begin
    if v_ecg_acts[i].r_type=0 then  // Отметка
    begin
      FrmEcgFrag.vPosI := i;
      FrmEcgFrag.vLPntiBeg  := v_ecg_acts[i].vPntiBeg;
      FrmEcgFrag.vLPnti1Beg := v_ecg_acts[i].vPnti1Beg;
      FrmEcgFrag.vLPnti2Beg := v_ecg_acts[i].vPnti2Beg;
      FrmEcgFrag.vLPntiEnd  := v_ecg_acts[i].vPntiEnd;
      FrmEcgFrag.vLPnti1End := v_ecg_acts[i].vPnti1End;
      FrmEcgFrag.vLPnti2End := v_ecg_acts[i].vPnti2End;
      FrmEcgFrag.setSize( Trunc(Screen.Width/2) ,
                         Trunc(Screen.Height/2) );
      FrmEcgFrag.scrBox.Visible:=True;
      FrmEcgFrag.Position:=poScreenCenter;
      FrmEcgFrag.vKhoriz    := gtKoefX ;
      FrmEcgFrag.vKvert     := gtKoefY ;
      FrmEcgFrag.seZoomHoriz.Value    := FrmEcgFrag.vKhoriz ;
      FrmEcgFrag.seZoomVert.Value     := FrmEcgFrag.vKvert ;
      FrmEcgFrag.seZoomVert.Value := FrmEcgFrag.vKvert;
      FrmEcgFrag.seZoomHoriz.Value := FrmEcgFrag.vKhoriz;
      FrmEcgFrag.CnsDMTable1:= CnsDMTable1 ;
      FrmEcgFrag.vS_height_channel_ECG := v_height_channel_ECG;
      FrmEcgFrag.seHPix.Value := FrmEcgFrag.vS_height_channel_ECG;
      v_WaveformData := CnsDMTable1[DicomMV.CurrentImage].Attributes.fWaveformData ;
      FrmEcgFrag.vSamplingFrequency := v_WaveformData.v_data[ FrmEcgFrag.vLPntiBeg ].r_pnt_data[ FrmEcgFrag.vLPnti2Beg,FrmEcgFrag.vLPnti1Beg ].r_SamplingFrequency;
      // 1 скопируем массив
      SetLength( FrmEcgFrag.cArr, (FrmEcgFrag.vLPnti1End-FrmEcgFrag.vLPnti1Beg) );
      for j := 0 to Length(FrmEcgFrag.cArr) - 1 do
        FrmEcgFrag.cArr[j].P_val := v_WaveformData.v_data[FrmEcgFrag.vLPntiBeg].r_data[j+FrmEcgFrag.vLPnti1Beg,FrmEcgFrag.vLPnti2Beg] ;
        FrmEcgFrag.cArr[j].P_x := -1;
        FrmEcgFrag.cArr[j].p_y := -1;
      Break;
    end;
    I:=i-1;
  end;
  FrmEcgFrag.vUpd:=True;
  FrmEcgFrag.ECGCalc;
  FrmEcgFrag.Show;
end;

procedure TMultiForms.dxBarButton37Click(Sender: TObject);
var i:integer;
begin
  for I := 0 to vFrgECG.Count - 1 do
    TFrmEcgFrag(vFrgECG[i]).Show;
end;

procedure TMultiForms.dxBarButton38Click(Sender: TObject);
var v1,v2:Integer;
begin  // Предыдущий снимок
  v1 := DicomMV.CurrentImage;
  if DicomMV.CurrentImage>0 then
  begin
  {  if ((DicomMV.DicomDatasets[DicomMV.CurrentImage].Attributes.ImageData<>nil) and
        (DicomMV.DicomDatasets[DicomMV.CurrentImage-1].Attributes.ImageData<>nil)) then
    begin  }
      DicomMV.SetCurrentImage(DicomMV.CurrentImage-1);
  //  end;
  end;
  v2 := DicomMV.CurrentImage;
  DicomMV.Refresh;
 // DicomMVCurrentImageTo(Sender, v1, v2 );
  // выполнение действия
 // frmSnimki.p_action_frm;
  Application.ProcessMessages;
end;

procedure TMultiForms.dxBarButton39Click(Sender: TObject);
var v1,v2:Integer;
begin // Следующий снимок
  v1 := DicomMV.CurrentImage;
  if DicomMV.CurrentImage<DicomMV.DicomDatasets.Count then
    DicomMV.SetCurrentImage(DicomMV.CurrentImage+1);
  v2 := DicomMV.CurrentImage;
 // DicomMVCurrentImageTo(Sender, v1, v2 );
  // выполнение действия
 // frmSnimki.p_action_frm;
  Application.ProcessMessages;
end;

procedure TMultiForms.pMove ( pMm : Byte );
var Bitmap: TCnsBitmap32;
begin
  if assigned(DicomMV.ActiveView) then
  begin
  //  Bitmap := DicomMV.ActiveView.Bitmap ;
  //  DicomMV.ActiveView.Bitmap.Clear;
    if pMm=1 then begin            // Смещение снимка вниз
      DicomMV.ActiveView.Top := DicomMV.ActiveView.Top+Trunc(DicomMV.ActiveView.Height*cZm);
    end else if pMm=2 then begin   // Смещение снимка вверх
      DicomMV.ActiveView.Top := DicomMV.ActiveView.Top-Trunc(DicomMV.ActiveView.Height*cZm);
    end else if pMm=3 then begin   // Смещение снимка влево
      DicomMV.ActiveView.Left := DicomMV.ActiveView.Left-Trunc(DicomMV.ActiveView.Width*cZm);
    end else if pMm=4 then begin   // Смещение снимка вправо
      DicomMV.ActiveView.Left := DicomMV.ActiveView.Left+Trunc(DicomMV.ActiveView.Width*cZm); //
    end;
  //  DicomMV.ActiveView.Bitmap := Bitmap;
  end;
end;

procedure TMultiForms.pZoom ( pZm : Boolean );
var vZoom : Integer;
begin
  if assigned(DicomMV.ActiveView) then
  begin
    if pZm then vZoom := 1 else vZoom := -1;
    //
    DicomMV.ActiveView.Scale := DicomMV.ActiveView.Scale + cZm*vZoom ;

    // DicomMV.Align := alNone;
    // DicomMV.Top:=0;
    // DicomMV.Left:=0;

   // DicomMV.ActiveView.Top := DicomMV.ActiveView.Top-Trunc(DicomMV.ActiveView.Height*cZm*vZoom);
   // DicomMV.ActiveView.Left := DicomMV.ActiveView.Left-Trunc(DicomMV.ActiveView.Width*cZm*vZoom);
    //
   // DicomMV.ActiveView.Height := DicomMV.ActiveView.Height+Trunc(DicomMV.ActiveView.Height*cZm*vZoom);
   // DicomMV.ActiveView.Width := DicomMV.ActiveView.Width+Trunc(DicomMV.ActiveView.Width*cZm*vZoom);

  end;
end;

procedure TMultiForms.dxBarButton42Click(Sender: TObject);
begin // Увеличить размер снимка
  pZoom(True);
end;

procedure TMultiForms.dxBarButton43Click(Sender: TObject);
begin  // Уменьшить размер снимка
  pZoom(False);
end;

procedure TMultiForms.dxBarButton45Click(Sender: TObject);
begin  // Смещение снимка вниз
  pMove(1);
end;

procedure TMultiForms.dxBarButton46Click(Sender: TObject);
begin // Смещение снимка вверх
  pMove(2);
end;

procedure TMultiForms.dxBarButton47Click(Sender: TObject);
begin  // Смещение снимка влево
  pMove(3);
end;

procedure TMultiForms.dxBarButton48Click(Sender: TObject);
begin  // Смещение снимка вправо
  pMove(4);
end;

procedure TMultiForms.bbHeadClick(Sender: TObject);
var v_curr_index : Integer; v_is_add : Boolean;
begin
  v_is_add:=False;
  v_curr_index:=DicomMV.ActiveView.AttributesIndex;
  if v_curr_index>=0 then
  begin
    try
      Application.CreateForm(TfrmHeader, frmHeader);
      // FInfoAttributes
      {
      if DicomMV.DicomDatasets.Item[v_curr_index].InfoAttributes.Count=0 then
      begin
        v_is_add:=True;
        DicomMV.DicomDatasets.Item[v_curr_index].PrepareInfoAttributes(
         DicomMV.DicomDatasets.Item[v_curr_index].Attributes.ImageData.ImageData[0].TransferSyntax
         );
      end;
      frmHeader.attr_tree_crt( DicomMV.DicomDatasets.Item[v_curr_index].InfoAttributes );
      // FAttributes
      frmHeader.attr_tree_crt( DicomMV.DicomDatasets.Item[v_curr_index].Attributes );
      }
      if CnsDMTable1.Item[v_curr_index].InfoAttributes.Count=0 then
      begin
        v_is_add:=True;
        if CnsDMTable1.Item[v_curr_index].Attributes.ImageData<>nil then
          CnsDMTable1.Item[v_curr_index].PrepareInfoAttributes(
             CnsDMTable1.Item[v_curr_index].Attributes.ImageData.ImageData[0].TransferSyntax
             );
      end;
      frmHeader.attr_tree_crt( CnsDMTable1.Item[v_curr_index].InfoAttributes );
      // FAttributes
      frmHeader.attr_tree_crt( CnsDMTable1.Item[v_curr_index].Attributes );

    //  DicomMV.DicomDatasets.Item[v_curr_index].Attributes.ListAttrinute('', frmHeader.memHead.Lines);
      frmHeader.ShowModal;
    finally
      frmHeader.Free;
      if v_is_add then DicomMV.DicomDatasets.Item[v_curr_index].InfoAttributes.Clear;     
    end;
  end else
  begin
    MessageDlg('Не выбран снимок', mtWarning, [mbOK], 0);
  end;
end;

procedure TMultiForms.bbMPRClick(Sender: TObject);
var das1: TDicomDatasets;
begin
  das1 := DicomMV.DicomDatasets;
  with TMprForm.Create(self) do
    begin
      try
        n1 := TDicomMPRImage.Create(das1, DicomMV.ActiveView.Attributes.getString($20, $E));
        MPRDicomImage1.DicomDatasets := das1;
        MPRDicomImage1.AttributesIndex := DicomMV.CurrentImage;
        MPRDicomImage1.SeriesUID := DicomMV.ActiveView.Attributes.getString($20, $E);
        ShowModal;
      finally
        Free;
      end;
    end;
end;

procedure TMultiForms.BarOpenCloseClick(Sender: TObject);
var i : Integer;
begin // раскрыть формочку на весь экран
  Self.v_is_full_screen := (not Self.v_is_full_screen) ;
  for I := 0 to v_Snimki.Count - 1 do
    (TWinControl(v_Snimki[i]) as TMultiForms).v_is_hide := Self.v_is_full_screen;
  Self.v_is_hide := False;
  if Self.v_is_full_screen then
  begin
    BarOpenClose.ImageIndex:=8; // свернуть
    BarOpenClose.Hint:='Свернуть окно';
  end else
  begin
    BarOpenClose.ImageIndex:=7; // развернуть
    BarOpenClose.Hint:='Развернуть на весь экран';
  end;
  // перерисовка всех формочек
  FrmSnimkiRefr;
  frm_mrk;
end;

procedure TMultiForms.dxBarButton9Click(Sender: TObject);
begin // задать размер
  Application.CreateForm(TFrmSize, FrmSize);
  try
    FrmSize.Top  := Mouse.CursorPos.Y;
    FrmSize.Left := Mouse.CursorPos.X;
    FrmSize.seColumns.Value := 1;
    FrmSize.seRows.Value := 1;
    if FrmSize.ShowModal=mrOk then
    begin
      DicomMV.Columns := FrmSize.seColumns.Value;
      DicomMV.Rows    := FrmSize.seRows.Value;
    end;
  finally
    FreeAndNil(FrmSize);
  end;
end;

procedure TMultiForms.dxBarColorCombo2Change(Sender: TObject);
begin  // Цвет разделителей
  v_color_rzd_ECG := dxBarColorCombo2.Color;
  set_ECG_Zoom;
end;

procedure TMultiForms.dxBarColorCombo3Change(Sender: TObject);
begin  // Цвет текста
  v_color_text_ECG := dxBarColorCombo3.Color;
  set_ECG_Zoom;
end;

procedure TMultiForms.dxBarColorCombo4Change(Sender: TObject);
begin  // Цвет кривой ЭКГ
  v_color_line_ECG := dxBarColorCombo4.Color;
  set_ECG_Zoom;
end;

procedure TMultiForms.dxBarColorCombo5Change(Sender: TObject);
begin  // Цвет разделителей групп
  v_color_rzd_grp_ECG := dxBarColorCombo5.Color;
  set_ECG_Zoom;
end;

procedure TMultiForms.dxBarFontNameCombo1Change(Sender: TObject);
begin  // Шрифт
  v_font_ECG.Name := (Sender as TdxBarFontNameCombo).CurText;
  set_ECG_Zoom;
end;

procedure TMultiForms.dxBarSpinEdit1ButtonClick(Sender: TdxBarSpinEdit;
  Button: TdxBarSpinEditButton);
begin // Размер шрифта
  v_size_font_ECG := (Sender as TdxBarSpinEdit).IntCurValue;
  btnShapeIniColor;
  (Sender as TdxBarSpinEdit).Enabled:=False;
  set_ECG_Zoom;
  (Sender as TdxBarSpinEdit).Enabled:=True;
end;

procedure TMultiForms.dxBarSpinEdit2ButtonClick(Sender: TdxBarSpinEdit;
  Button: TdxBarSpinEditButton);
begin  // Толщина линии разделителя
  v_size_line_rzd_ECG := (Sender as TdxBarSpinEdit).IntCurValue;
  btnShapeIniColor;
  (Sender as TdxBarSpinEdit).Enabled:=False;
  set_ECG_Zoom;
  (Sender as TdxBarSpinEdit).Enabled:=True;
end;

procedure TMultiForms.dxBarSpinEdit3ButtonClick(Sender: TdxBarSpinEdit;
  Button: TdxBarSpinEditButton);
begin
  v_size_line_ECG := (Sender as TdxBarSpinEdit).IntCurValue;
  btnShapeIniColor;
  (Sender as TdxBarSpinEdit).Enabled:=False;
  set_ECG_Zoom;
  (Sender as TdxBarSpinEdit).Enabled:=True;
end;

procedure TMultiForms.dxBarSpinEdit4ButtonClick(Sender: TdxBarSpinEdit;
  Button: TdxBarSpinEditButton);
begin  // Размер шрифта
  v_height_channel_ECG := (Sender as TdxBarSpinEdit).IntCurValue;
  btnShapeIniColor;
  (Sender as TdxBarSpinEdit).Enabled:=False;
  set_ECG_Zoom;
  (Sender as TdxBarSpinEdit).Enabled:=True;
end;

procedure TMultiForms.set_ECG_Zoom;
begin
  //v_koeff_horiz := 25;
  //v_koeff_vert  := 10;
  v_koeff_horiz := gtKoefX;
  v_koeff_vert  := gtKoefY;
  // отрисовка ЭКГ
  pECGdraw ( CnsDMTable1,            // массив DICOM с данными исследования
             img1,                   // Bitmap для отрисовки ECG
             v_ecg_acts,             // array of t_ecg_actions
             v_koeff_horiz,          // масштаб горизонтально мм/с
             v_koeff_vert,           // масштаб вертикально мм/мВ
             dxBarButton28.Down,     // pECGdraw
             dxBarButton32.Down );   // Показать точки Q,R,S
end;

procedure TMultiForms.ecg_horiz_25Click(Sender: TObject);
begin  // 25 мм/с
 // ecg_horiz_25.Down:=True;
  ecg_horiz_50.Down:=False;
  ecg_horiz_100.Down:=False;
  ecg_horiz_200.Down:=False;
  set_ECG_Zoom;
end;

procedure TMultiForms.ecg_horiz_50Click(Sender: TObject);
begin // 50 мм/с
  ecg_horiz_25.Down:=False;
//  ecg_horiz_50.Down:=True;
  ecg_horiz_100.Down:=False;
  ecg_horiz_200.Down:=False;
  set_ECG_Zoom;
end;

procedure TMultiForms.ecg_horiz_100Click(Sender: TObject);
begin  // 100  мм/с
  ecg_horiz_25.Down:=False;
  ecg_horiz_50.Down:=False;
 // ecg_horiz_100.Down:=True;
  ecg_horiz_200.Down:=False;
  set_ECG_Zoom;
end;

procedure TMultiForms.ecg_horiz_200Click(Sender: TObject);
begin  // 200  мм/с
  ecg_horiz_25.Down:=False;
  ecg_horiz_50.Down:=False;
  ecg_horiz_100.Down:=False;
//  ecg_horiz_200.Down:=True;
  set_ECG_Zoom;
end;

procedure TMultiForms.ecg_vert_5Click(Sender: TObject);
begin //5 мм/мВ
//  ecg_vert_5.Down:=True;
  ecg_vert_10.Down:=False;
  ecg_vert_15.Down:=False;
  ecg_vert_20.Down:=False;
  ecg_vert_25.Down:=False;
  ecg_vert_40.Down:=False;
  ecg_vert_75.Down:=False;
  set_ECG_Zoom;
end;

procedure TMultiForms.ecg_vert_10Click(Sender: TObject);
begin // 10 мм/мВ
  ecg_vert_5.Down:=False;
//  ecg_vert_10.Down:=True;
  ecg_vert_15.Down:=False;
  ecg_vert_20.Down:=False;
  ecg_vert_25.Down:=False;
  ecg_vert_40.Down:=False;
  ecg_vert_75.Down:=False;
  set_ECG_Zoom;
end;

procedure TMultiForms.ecg_vert_15Click(Sender: TObject);
begin  // 15 мм/мВ
  ecg_vert_5.Down:=False;
  ecg_vert_10.Down:=False;
//  ecg_vert_15.Down:=True;
  ecg_vert_20.Down:=False;
  ecg_vert_25.Down:=False;
  ecg_vert_40.Down:=False;
  ecg_vert_75.Down:=False;
  set_ECG_Zoom;
end;

procedure TMultiForms.ecg_vert_20Click(Sender: TObject);
begin  // 20 мм/мВ
  ecg_vert_5.Down:=False;
  ecg_vert_10.Down:=False;
  ecg_vert_15.Down:=False;
//  ecg_vert_20.Down:=True;
  ecg_vert_25.Down:=False;
  ecg_vert_40.Down:=False;
  ecg_vert_75.Down:=False;
  set_ECG_Zoom;
end;

procedure TMultiForms.ecg_vert_25Click(Sender: TObject);
begin  // 25  мм/мВ
  ecg_vert_5.Down:=False;
  ecg_vert_10.Down:=False;
  ecg_vert_15.Down:=False;
  ecg_vert_20.Down:=False;
//  ecg_vert_25.Down:=True;
  ecg_vert_40.Down:=False;
  ecg_vert_75.Down:=False;
  set_ECG_Zoom;
end;

procedure TMultiForms.ecg_vert_40Click(Sender: TObject);
begin  // 40 мм/мВ
  ecg_vert_5.Down:=False;
  ecg_vert_10.Down:=False;
  ecg_vert_15.Down:=False;
  ecg_vert_20.Down:=False;
  ecg_vert_25.Down:=False;
//  ecg_vert_40.Down:=True;
  ecg_vert_75.Down:=False;
  set_ECG_Zoom;
end;

procedure TMultiForms.ecg_vert_75Click(Sender: TObject);
begin // 75  мм/мВ
  ecg_vert_5.Down:=False;
  ecg_vert_10.Down:=False;
  ecg_vert_15.Down:=False;
  ecg_vert_20.Down:=False;
  ecg_vert_25.Down:=False;
  ecg_vert_40.Down:=False;
//  ecg_vert_75.Down:=True;
  set_ECG_Zoom;
end;

procedure TMultiForms.FrameConstrainedResize(Sender: TObject; var MinWidth,
  MinHeight, MaxWidth, MaxHeight: Integer);
var v_modality : string;
begin
  try
    v_modality := CnsDMTable1[DicomMV.CurrentImage].Attributes.GetString( $8, $60 ) ;
    if v_modality<>'ECG' then
      DicomMV.Align := alClient;
  except
    DicomMV.Align := alClient;
  end;
end;

procedure FrmSnimkiRefr;
var v_amm, i : Integer;
begin
  v_amm:=clc_amm_frm;
  if v_amm>0
  then
  begin
    p_act_window;
    if v_amm=1 then
    begin
      for I := 0 to v_Snimki.Count - 1 do
      begin
        if (TWinControl(v_Snimki[i]) as TMultiForms).v_is_visible then
        begin
          cmn_frm_mrk ( TWinControl(v_Snimki[i]) as TMultiForms );
          Break;
        end;
      end;
    end;
  end
  else  // если снимков не остается - закроем окно
    frmSnimki.ModalResult:=mrOk;
end;

procedure TMultiForms.BtnExitClick(Sender: TObject);
var i : Integer;
    v_chk : Boolean;
    vmy_tabsheet: TcxTabSheet;
begin
  if Timer1.Enabled then  
    Timer1.Enabled:=False;
  // проверим остался ли объект по этому vp_P_PID
  // текущий tabsheet
  vmy_tabsheet := (Self.vp_tabsheet as TcxTabSheet);
  // цикл по формочкам
  v_chk:=False;
  for I := 0 to v_Snimki.Count - 1 do
  begin
    if ((vmy_tabsheet=(TWinControl(v_Snimki[i]) as TMultiForms).vp_tabsheet) and
        ((TWinControl(v_Snimki[i]) as TMultiForms)<>Self) and
        ((TWinControl(v_Snimki[i]) as TMultiForms).v_is_visible)
        )
    then
    begin
      v_chk:=True;
      Break;
    end;
  end;
  // если нет - удаляем закладку вверху
  if not v_chk then begin
    (vmy_tabsheet as TcxTabSheet).Free;
  end;
  // посчитаем кол-во закладок вверху, посчитаем кол-во неудаленных формочек
  if ((clc_amm_frm=1) and ((frmSnimki.cxPageControl1.PageCount>=1))) then
  begin // если осталась 1 формочка - обнуляем dataset в ней
    CnsDMTable1.ClearList;
    DicomMV.DicomDatasets.ClearList;
    DicomMV.Update;
    // инициализируем переменные
    Self.vp_P_PID            := ''; // P_PID пациента
    Self.vp_StudyInstanceUID := ''; // STUDYUID
  end else
  begin // иначе - убираем текущую формочку
    Self.Visible:=False;
    Self.v_is_visible:=False;
  end;
  // если осталась одна закладка - сделаем ее невидимой
  if (frmSnimki.cxPageControl1.PageCount=1)
  and frmSnimki.v_is_frm
  then
    frmSnimki.cxPageControl1.HideTabs:=True;
  // перерисовка всех формочек
  FrmSnimkiRefr;
end;

procedure TMultiForms.btnPlayClick(Sender: TObject);
var Wd : HWnd; 
begin
 { while True do
  begin
    Wd:=FindWindow(0,'JPEG Library Error');
    if (Wd<>0) then
      SendMessage( Wd, WM_CLOSE, 0,0)
    else Break;  
  end; }

  if not MyCineActive then
  begin
    MyCineActive := true;
    {
    tbSpeedVideo.Properties.Min:=1;
    tbSpeedVideo.Properties.Max:=TCustomDicomImage( CnsDMTable1[CnsDMTable1.Currentindex].Attributes ).GetFrameCount;
    }
    btnPlay.ImageIndex:=13;
    Timer1.Enabled:=True;
    btnPlay.Hint:='Стоп';
    v_timewrk1video:=GetTickCount;
  end else
  begin
    MyCineActive := false;
    Timer1.Enabled:=False;
    btnPlay.ImageIndex:=11;
    btnPlay.Hint:='Показать';
    v_timewrk1video:=GetTickCount;
  end;
end;

procedure TMultiForms.cxBarEditItem2PropertiesChange(Sender: TObject);
begin // Жирный шрифт
  v_bold_font_ECG := (Sender as TcxBarEditItem).CurEditValue;
  btnShapeIniColor;
  set_ECG_Zoom;
end;

procedure TMultiForms.cxBarEditItem3PropertiesChange(Sender: TObject);
begin // Под наклоном
  v_italic_font_ECG := (Sender as TcxBarEditItem).CurEditValue;
  btnShapeIniColor;
  set_ECG_Zoom;
end;

procedure TMultiForms.cxButton1Click(Sender: TObject);
begin
  if Shape1.Brush.Color<>clWhite then
    Shape1.Brush.Color:=clWhite
  else
    Shape1.Brush.Color:=clRed;
end;

procedure TMultiForms.btnDirectClick(Sender: TObject);
begin
if not MyCineDirection then
  begin
    btnDirect.ImageIndex:=14;
    MyCineDirection := true;
//    btnDirect.Hint:='Направление видео';
  end
  else
  begin
    btnDirect.ImageIndex:=12;
    MyCineDirection := false;
//    btnDirect.Hint:='Направление видео';
  end;
end;

procedure TMultiForms.WMNCPaint ( const p_is_active:Boolean );
var DC: HDC;
    Pen: hPen;
    OldPen: hPen;
    OldBrush: HBRUSH;
const c_width = 4;
      c_menu_height = 15;
begin
  Self.v_is_selected:=p_is_active;
  DC := GetWindowDC (Self.Handle);
  if p_is_active then begin
    Pen := CreatePen (PS_SOLID, c_width, RGB (255, 0, 0));
  end else begin
    Pen := CreatePen (PS_SOLID, c_width, RGB (v_R, v_G, v_B));
  end;
  OldPen := SelectObject (DC, Pen);
  OldBrush := SelectObject (DC, GetStockObject (NULL_BRUSH));
  Rectangle (DC, 1, 1, Width, Height);
  SelectObject (DC, OldBrush);
  SelectObject (DC, OldPen);
  DeleteObject (Pen);
  ReleaseDC (Pen, Self.Handle);
end;

function gt_active_form : TMultiForms;
var i:Integer; v_res:TMultiForms;
begin
  v_res:=nil;
  // цикл по всем окнам приложения и деактивация
  for I := 0 to fSnimki.v_forms_list.Count - 1 do
  begin
    if (TWinControl(fSnimki.v_forms_list[i]) as TMultiForms).v_is_selected
    then
    begin
      v_res := (TWinControl(fSnimki.v_forms_list[i]) as TMultiForms) ;
      break;
    end;
  end;
  gt_active_form:=v_res;
end;

// инициализация цвета кнопок
procedure TMultiForms.btnShapeIniColor;
begin
  Shape1.Brush.Color := v_color_fon_ECG;       // Цвет фона ЭКГ  Shape1.Brush.Color := v_color_fon_ECG;
  Shape2.Brush.Color := v_color_rzd_ECG;       // Цвет разделителей
  Shape3.Brush.Color := v_color_rzd_grp_ECG;   // Цвет разделителей групп

  dxBarSpinEdit2.IntValue := v_size_line_rzd_ECG;  // Толщина линии разделителя

  Shape4.Brush.Color := v_color_text_ECG;      // Цвет текста
  Shape5.Brush.Color := v_color_line_ECG;      // Цвет кривой ЭКГ

  dxBarSpinEdit3.IntValue := v_size_line_ECG;      // Толщина кривой ЭКГ
  dxBarFontNameCombo1.CurText := v_font_ECG.Name;  // Шрифт
  dxBarSpinEdit1.IntValue := v_size_font_ECG;      // Размер шрифта
  cxBarEditItem2.EditValue := v_bold_font_ECG;     // Жирный шрифт
  cxBarEditItem3.EditValue := v_italic_font_ECG;   // Под наклоном
  dxBarSpinEdit4.IntValue := v_height_channel_ECG;      //
  Shape6.Brush.Color := v_otmetka_ECG;             // отметка
end;

// Цвет разделителей -----------------------------------------------------------
procedure TMultiForms.cmn_color_rzd_ECG;
begin
  ColorDialog1.Color:=v_color_rzd_ECG;
  if ColorDialog1.Execute then
  begin
    v_color_rzd_ECG := ColorDialog1.Color;
    btnShapeIniColor;
    set_ECG_Zoom;
  end;
end;

procedure TMultiForms.Panel5Click(Sender: TObject);
begin
  cmn_color_rzd_ECG;
end;

procedure TMultiForms.Label2Click(Sender: TObject);
begin
  cmn_color_rzd_ECG;
end;

procedure TMultiForms.Shape2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cmn_color_rzd_ECG;
end;

// Цвет разделителей групп -----------------------------------------------------
procedure TMultiForms.cmn_color_rzd_grp_ECG;
begin
  ColorDialog1.Color:=v_color_rzd_grp_ECG;
  if ColorDialog1.Execute then
  begin
    v_color_rzd_grp_ECG := ColorDialog1.Color;
    btnShapeIniColor;
    set_ECG_Zoom;
  end;
end;

procedure TMultiForms.Label3Click(Sender: TObject);
begin
  cmn_color_rzd_grp_ECG;
end;

procedure TMultiForms.Shape3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cmn_color_rzd_grp_ECG;
end;

procedure TMultiForms.Panel6Click(Sender: TObject);
begin
  cmn_color_rzd_grp_ECG;
end;

// Цвет текста -----------------------------------------------------------------
procedure TMultiForms.cmn_color_text_ECG;
begin
  ColorDialog1.Color:=v_color_text_ECG;
  if ColorDialog1.Execute then
  begin
    v_color_text_ECG := ColorDialog1.Color;
    btnShapeIniColor;
    set_ECG_Zoom;
  end;
end;

procedure TMultiForms.Panel7Click(Sender: TObject);
begin
  cmn_color_text_ECG;
end;

procedure TMultiForms.Label4Click(Sender: TObject);
begin
  cmn_color_text_ECG;
end;

procedure TMultiForms.Shape4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cmn_color_text_ECG;
end;

// цвет отметки  ---------------------------------------------------------------
procedure TMultiForms.cmn_otmetka_ECG;
begin
  ColorDialog1.Color:=v_otmetka_ECG;
  if ColorDialog1.Execute then
  begin
    v_otmetka_ECG := ColorDialog1.Color;
    btnShapeIniColor;
    set_ECG_Zoom;
  end;
end;

procedure TMultiForms.Shape6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cmn_otmetka_ECG;
end;

procedure TMultiForms.Label6Click(Sender: TObject);
begin
  cmn_otmetka_ECG;
end;

procedure TMultiForms.Panel9Click(Sender: TObject);
begin
  cmn_otmetka_ECG;
end;

// Цвет кривой ЭКГ -------------------------------------------------------------
procedure TMultiForms.cmn_color_line_ECG;
begin
  ColorDialog1.Color:=v_color_line_ECG;
  if ColorDialog1.Execute then
  begin
    v_color_line_ECG := ColorDialog1.Color;
    btnShapeIniColor;
    set_ECG_Zoom;
  end;
end;

procedure TMultiForms.Shape5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cmn_color_line_ECG;
end;

procedure TMultiForms.Label5Click(Sender: TObject);
begin
  cmn_color_line_ECG;
end;

procedure TMultiForms.Panel8Click(Sender: TObject);
begin
  cmn_color_line_ECG;
end;

// Цвет фона ЭКГ ---------------------------------------------------------------
procedure TMultiForms.cmn_color_fon_ECG;
begin
  ColorDialog1.Color:=v_color_fon_ECG;
  if ColorDialog1.Execute then
  begin
    v_color_fon_ECG := ColorDialog1.Color;
    btnShapeIniColor;
    set_ECG_Zoom;
  end;
end;

procedure TMultiForms.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cmn_color_fon_ECG;
end;

procedure TMultiForms.Label1Click(Sender: TObject);
begin
  cmn_color_fon_ECG;
end;

procedure TMultiForms.Panel4Click(Sender: TObject);
begin
  cmn_color_fon_ECG;
end;

// -----------------------------------------------------------------------------
// ------------------------  STRUCTURED REPORTS  -------------------------------
// -----------------------------------------------------------------------------

// формирование файла structured reports для отображения в webbrowser
procedure TMultiForms.pFrmStructuredReportWebBrowserFrm ( das: TDicomDataset; pFileName:string; pWebPDF: TWebBrowser );
var FF : TextFile;
  procedure wrtHead;
  begin
    Writeln( FF, '<html><head><title>Comprehensive SR Document</title>'+
                 '<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">'+
                 '<meta name="generator" content="Dicom VCL"></head><body>' );
  end;
  procedure wrtFooter;
  begin
    Writeln( FF, '</body>' );
  end;    
  // Сохранение текста в файл для вывода в браузере
  // pTxt          - текст
  // pTypeText     - тип шрифта 0-обычный 1-обычный BOLD 2-большой bold 3-маленький 4-under 5-upper small
  // pIsBreakLine  - =True перенос строки после текста
  procedure wrtSrText ( pTxt : AnsiString; pTypeText:Integer=0; pIsBreakLine:Boolean=False );
  begin
    if ((Trim(pTxt)='') and pIsBreakLine) then Exit;    
    if pTypeText=0 then
      Writeln( FF, pTxt )
    else if pTypeText=1 then
      Writeln( FF, '<b>'+pTxt+'</b>' )
    else if pTypeText=2 then
      Writeln( FF, '<h1>'+pTxt+'</h1>' )
    else if pTypeText=3 then
      Writeln( FF, '<p><small>'+pTxt+'</small></p>' )
    else if pTypeText=4 then
      Writeln( FF, '<p><small><span class="under">'+pTxt+'</span></small></p>' )
    else if pTypeText=5 then
      Writeln( FF, '<a><sup><small>'+pTxt+'</a></sup></small>' );
    if pIsBreakLine then  Writeln( FF, '</BR>' );    
  end;
  procedure shHeadInfo ( pGrp, pEl : Integer; pTxt : string );
  begin
    if Assigned(das.Attributes.Item[ pGrp, pEl ] ) then
        if das.Attributes.GetString( pGrp, pEl )<>'' then
        begin
          wrtSrText ( pTxt, 1, False );
          wrtSrText ( das.Attributes.GetString( pGrp, pEl ), 0, True );
        end;
  end;
  procedure DcmFrmTree ( pDicomAttribute : TDicomAttribute; pShowTextTags:Boolean=False );
  var i:Integer; vValueType : string;
    procedure strTagWrt ( pfsDicomAttribute : TDicomAttribute;
                          pi       : Integer;
                          pGrp     : Word;
                          pEl      : Word;
                          pStr     : string ='';
                          pStrAft  : string ='';
                          pFont    : integer = 0;
                          pNewLine : boolean = True );
    begin
      if Assigned(pfsDicomAttribute.Attributes[pi].Item[ pGrp, pEl ] ) then
        if pfsDicomAttribute.Attributes[pi].GetString( pGrp, pEl )<>'' then
          if pStr='' then
            wrtSrText ( Trim( pfsDicomAttribute.Attributes[pi].GetString( pGrp, pEl )+' '+pStrAft ) , pFont, pNewLine )
          else
            wrtSrText ( Trim( pStr+' '+pfsDicomAttribute.Attributes[pi].GetString( pGrp, pEl )+' '+pStrAft ) , pFont, pNewLine );
    end;
    function GtStrTag ( pfsDicomAttribute : TDicomAttribute; pi:Integer; pGrp, pEl : Word; pStr:string ='' ):string;
    begin
      if Assigned(pfsDicomAttribute.Attributes[pi].Item[ pGrp, pEl ] ) then
        Result := pStr+pfsDicomAttribute.Attributes[pi].GetString( pGrp, pEl )
      else
        Result := '';
    end;
    procedure strTagTreeLoop ( pfsDicomAttribute : TDicomAttribute; pi:Integer; pGrp, pEl : Word; pNewLine:Boolean=True );
    begin
      if Assigned(pfsDicomAttribute.Attributes[pi].Item[ pGrp, pEl ] ) then
      begin
        if pNewLine then wrtSrText ( '', 0, True );
        DcmFrmTree( pfsDicomAttribute.Attributes[pi].Item[ pGrp, pEl ] );
      end;
    end;
    procedure pValTypeShow ( pHeaderStr:string; pfDicomAttribute : TDicomAttribute; pi:Integer; pValueType:string; pRelShow:Word=0 );
    var vStrTmp, vStrTmp1 :string;
      function MyChkAss ( pGrp,pEl:Integer ):Boolean;
      begin
        Result:=Assigned(pfDicomAttribute.Attributes[pi].Item[ pGrp, pEl ] );
      end;
      function gtStr( pStr:string ):string;
      begin
        if pStr='Text Code' then Result:=''
        else if pStr='Code' then Result:=''
        else Result:=pStr;
      end;
    begin
      if pHeaderStr<>'' then wrtSrText ( pHeaderStr, 0, True );
    //  strTagWrt ( pfDicomAttribute, pi, $40, $A30A );   // NumericValue
      strTagTreeLoop( pfDicomAttribute, pi, $40, $A073 );
      strTagTreeLoop( pfDicomAttribute, pi, $40, $A043 );

      strTagTreeLoop( pfDicomAttribute, pi, $40, $A300 );
      strTagTreeLoop( pfDicomAttribute, pi, $40, $A730 ); // ContentSequence
      strTagTreeLoop( pfDicomAttribute, pi, $8, $1199 );  // ReferencedSOPSequence
    //  strTagTreeLoop( pfDicomAttribute, pi, $40, $A168 );
      //
      if MyChkAss( $40, $A168 ) then
      begin
        vStrTmp := gtStr ( TDicomAttribute(pfDicomAttribute.Attributes[pi].Item[ $0040, $A168 ]).Attributes[0].GetString($0008, $0104) ) ;
        if vStrTmp<>'Sample Code' then                         // !!!!!!!!!!!!!!!!!!!!
          wrtSrText ( Trim( vStrTmp ) , 0, True );
      end else
      if ((pValueType='TEXT') and MyChkAss($0040, $A160 ) and MyChkAss($0040, $A043 ) )
      then begin
        vStrTmp := ''; // gtStr ( TDicomAttribute(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ]).Attributes[0].GetString($0008, $0104) ) ;
        strTagWrt ( pfDicomAttribute, pi, $40, $A160, vStrTmp );
      end else
      //
      if MyChkAss( $0040, $A043 ) and  MyChkAss( $0040, $A300 )
      then begin
        vStrTmp := gtStr ( TDicomAttribute(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ]).Attributes[0].GetString($0008, $0104) ) ;
        wrtSrText ( Trim( vStrTmp ) , 0, True );
      end else
      if ( Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A30A ] ) and
           Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $08EA ] ) )    // MeasurementUnitsCodeSequence
      then begin
        vStrTmp := TDicomAttribute(pfDicomAttribute.Attributes[pi].Item[ $0040, $08EA ]).Attributes[0].GetString($0008, $0100) ;
        strTagWrt ( pfDicomAttribute, pi, $40, $A30A, '', vStrTmp);
      end else
      //
     if Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ] ) and // Sequence Data
         Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A120 ] )    // DateTime
     then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A120, ' ' );
      end else
      if Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ] ) and // Sequence Data
         Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A121 ] )    // Date
      then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A121, ' ' );
      end else
      if Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ] ) and // Sequence Data
         Assigned(pfDicomAttribute.Attributes[pi].Item[ $40, $A122 ] )      // Time
      then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A122, ' ' );
      end else
      if Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ] ) and // Sequence Data
         Assigned(pfDicomAttribute.Attributes[pi].Item[ $40, $A123 ] )      // PersonName
      then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A123, ' ' );
      end else
      if pValueType='UIDREF' then begin
        vStrTmp := '' ; // TDicomAttribute(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ]).Attributes[0].GetString($0008, $0104) ;
        if Assigned(pfDicomAttribute.Attributes[pi].Item[ $0040, $A043 ]) then
          strTagWrt ( pfDicomAttribute, pi, $40, $A124, vStrTmp )
        else
          strTagWrt ( pfDicomAttribute, pi, $40, $A124, '' );
      end else if pValueType='CONTAINER' then begin
        strTagTreeLoop( pfDicomAttribute, pi, $40, $A124, False );  
      end else if pValueType='TEXT' then begin
        if Assigned(pfDicomAttribute.Attributes[pi].Item[ $08, $0104 ] ) then
          if ((pfDicomAttribute.Attributes[pi].GetString( $08, $0104 ) <> 'Text Code')
          and (pfDicomAttribute.Attributes[pi].GetString( $08, $0104 ) <> 'Code')
          and (pfDicomAttribute.Attributes[pi].GetString( $08, $0104 ) <> 'Sample Code'))
          then
            strTagWrt ( pfDicomAttribute, pi, $08, $0104, '', '', 1, False );
      end else if pValueType='COMPOSITE' then begin
        wrtSrText ( 'COMPOSITE (references to other composite objects, such as reports) : ', 0, True );
      end else if pValueType='IMAGE' then begin
      //  RichView1.AddNL( 'Снимок (references to image objects) :' ,0,0);
      end else if pValueType='CODE' then begin
      //  RichView1.AddNL( 'coded entries :' ,0,0);
      end else if pValueType='NUM' then begin
      //  RichView1.AddNL( 'numeric measurements with units :' ,0,0);
      end else if pValueType='PNAME' then begin
        strTagWrt ( pfDicomAttribute, pi, $0040, $A123, 'Person Name :' );
      end else if pValueType='DATE' then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A121 );
      end else if pValueType='TIME' then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A122 );
      end else if pValueType='DATETIME' then begin
        strTagWrt ( pfDicomAttribute, pi, $40, $A120 );
      end else if pValueType='WAVEFORM' then begin
        wrtSrText ( 'references to waveforms :', 0, True );
      end else if pValueType='SCOORD' then begin
        wrtSrText ( 'spatial coordinates :', 0, True );
      end else if pValueType='TCOORD' then begin
        wrtSrText ( 'temporal coordinates :', 0, True );
      end else begin
     {   if vValueType<>'' then
          wrtSrText ( ' ОШИБКА : ТИП НЕ ОПРЕДЕЛЕН : '+vValueType, 0, True );
      end else
      begin  }
      //  strTagWrt ( pfDicomAttribute, pi, $40, $A160 );   // TextValue
        strTagWrt ( pfDicomAttribute, pi, $08, $0104, '', ' ', 1, True );  // CodeMeaning - text comment
      end;
    end;
  var v_tmp, v_str : string;
  begin
    if (Assigned(pDicomAttribute) and (pDicomAttribute<>nil)) then
    for I := 0 to pDicomAttribute.GetCount - 1 do
    begin
      if pDicomAttribute.Attributes[i].GetString( $8, $A104 )='Length Unit'
      then begin
        strTagWrt ( pDicomAttribute, i, $8, $100, '', ' ' );
      end else
      if Assigned(pDicomAttribute.Attributes[i].Item[ $08, $0104 ] ) and pShowTextTags then
        strTagWrt ( pDicomAttribute, i, $08, $0104, '', ' ', 1, False );
      vValueType:=GtStrTag ( pDicomAttribute, i, $40, $A040 );
      v_str := GtStrTag ( pDicomAttribute, i, $40, $A030 )+' '+
                          StringReplace( GtStrTag ( pDicomAttribute, i, $40, $A075, ' ' ), '^',' ', [rfReplaceAll, rfIgnoreCase])+' '+
                          GtStrTag ( pDicomAttribute, i, $40, $A027, ' ' ) ;
      if Trim(v_str)<>'' then wrtSrText ( 'Verifying Observers : '+v_str, 0, True );
      if Assigned(pDicomAttribute.Attributes[i].Item[ $40, $A010 ] ) then begin  //  Relationship Types
        v_tmp := pDicomAttribute.Attributes[i].GetString( $40, $A010 ) ;
        if v_tmp='HAS OBS CONTEXT' then begin
          pValTypeShow ( 'OBSERVATION CONTEXT :', pDicomAttribute, i, vValueType, 1 );
        end else if v_tmp='HAS ACQ CONTEXT' then begin
          pValTypeShow ( 'ACQUISITION CONTEXT :', pDicomAttribute, i, vValueType, 2 );
        end else if v_tmp='CONTAINS' then begin
          pValTypeShow ( '', pDicomAttribute, i, vValueType, 3 );
        end else if v_tmp='INFERRED FROM' then begin
          pValTypeShow ( 'INFERRED : ', pDicomAttribute, i, vValueType, 4 );
        end else if v_tmp='HAS PROPERTIES' then begin
          pValTypeShow ( 'Properties : ', pDicomAttribute, i, vValueType, 5 );
        end else if v_tmp='SELECTED FROM' then begin
          pValTypeShow ( 'SELECTED FROM : ', pDicomAttribute, i, vValueType, 6 );
        end else if v_tmp='HAS CONCEPT MOD' then begin
          pValTypeShow ( '', pDicomAttribute, i, vValueType, 7 ); //  Concept Modifier :
        end else begin
          pValTypeShow ( '', pDicomAttribute, i, vValueType );
        end;
      end else
        pValTypeShow ( '', pDicomAttribute, i, vValueType );
      strTagWrt ( pDicomAttribute, i, $8, $1150, 'SOPClassUID :' );      // ReferencedSOPClassUID
      strTagWrt ( pDicomAttribute, i, $8, $1155, 'SOPInstanceUID :' );   // ReferencedSOPInstanceUID
    end;
  end;
begin
  AssignFile( FF, pFileName );
  try
    Rewrite(FF); wrtHead;

    if Assigned(das.Attributes.Item[ $10, $10 ] ) then
    begin
      wrtSrText ( 'Пациент : ', 1, False );
      wrtSrText ( StringReplace( das.Attributes.GetString( $10, $10 ), '^',' ',[rfReplaceAll, rfIgnoreCase]), 0, True );
    end;

    shHeadInfo ( $10, $30, 'Дата рождения : ' );

    if Assigned(das.Attributes.Item[ $10, $40 ] ) then
      if das.Attributes.GetString( $10, $40 )='F' then begin
        wrtSrText ( 'Пол : ', 1, False );
        wrtSrText ( 'женский', 0, True );
      end else begin
        wrtSrText ( 'Пол : ', 1, False );
        wrtSrText ( 'мужской', 0, True );
      end;

    shHeadInfo ( $8, $1030, 'Исследование : ' );
    shHeadInfo ( $8, $103E, 'Серия : ' );
    shHeadInfo ( $40, $A491, 'Completion Flag : ' );
    shHeadInfo ( $40, $A493, 'Verification Flag : ' );

    if das.Attributes.GetString( $8, $20 )<>'' then
    begin
      wrtSrText ( 'Дата исследования : ', 1, False );
      wrtSrText ( das.Attributes.GetString( $8, $20 )+' '+das.Attributes.GetString( $8, $30 ), 0, True );
    end;

    shHeadInfo ( $40, $A032, 'Observation Date : ' );

    if das.Attributes.GetString( $8, $23 )<>'' then
    begin
      wrtSrText ( 'Content Date : ', 1, False );
      wrtSrText ( das.Attributes.GetString( $8, $23 )+' '+das.Attributes.GetString( $8, $33 ), 0, True );
    end;

    shHeadInfo ( $0040, $A027, 'Verifying Organization : ' );
    shHeadInfo ( $0040, $A030, 'Verification Date Time : ' );
    shHeadInfo ( $0040, $A032, 'Observation Date Time : ' );

    wrtSrText ( '<hr>', 0, True );

    // das.SaveToFile('d:\test.dcm',True, JPEGLossless, 100 );

    if Assigned(das.Attributes.Item[ $8, $1199 ] ) then
      DcmFrmTree( das.Attributes.Item[ $8, $1199 ] );
    if Assigned(das.Attributes.Item[ $40, $A073 ] ) then
      DcmFrmTree( das.Attributes.Item[ $40, $A073 ] );
    if Assigned(das.Attributes.Item[ $40,$A043 ]) then
      DcmFrmTree ( das.Attributes.Item[ $40,$A043 ] ); //
    if Assigned(das.Attributes.Item[ $40,$A730 ]) then
      DcmFrmTree ( das.Attributes.Item[ $40,$A730 ] ); //
    
    wrtFooter;
  finally
    CloseFile(FF);
  end;
end;

function TMultiForms.CheckPDF : Boolean;
const BaseKey = '.pdf' ; BaseKey2 = '.PDF' ;
begin
  with TRegistry.Create do
    try
      RootKey := HKEY_CLASSES_ROOT ;
      Result := ( OpenKey(BaseKey, False) or OpenKey(BaseKey2, False) ) ;
    finally
      Free ;
    end ;
end;

function TMultiForms.PreviewPDF : ansistring;
var daPDF : TDicomAttribute;
begin
  v_pdf_filename:='';
  daPDF := CnsDMTable1[DicomMV.CurrentImage].Attributes.Item[ $42,$11 ];
  wbPDF.Visible:=True;
  if assigned(daPDF) then
  begin
    v_pdf_filename := PDUTempPath+'\'+inttostr(GetTickCount)+'.pdf' ;
    if frmSnimki.v_is_log then
      MnLg_ev( 'Try to use file : '+
               v_pdf_filename ,
               ExtractFilePath(paramstr(0))+'c_move.log',
               False );
    daPDF.SaveToFile( v_pdf_filename );
    if not FileExists(v_pdf_filename) then
    begin
      MessageDlg('File not found : '+v_pdf_filename, mtError, [mbOK], 0);
      MnLg_ev( 'File not found : '+v_pdf_filename,
               ExtractFilePath(paramstr(0))+'c_move.log',
               False );
      Exit;
    end;
    wbPDF.Align := alClient;
    try
      wbPDF.Navigate( v_pdf_filename );
    except
    on E:Exception do
      MessageDlg('Ошибка загрузки plugin Acrobat Reader ...'+#13+E.Message, mtError, [mbOK], 0);
    end;
  end;
  dxBarButton42.Visible:=ivNever;
  dxBarButton43.Visible:=ivNever;
  dxBarButton44.Visible:=ivNever;
  dxBarSubItem3.Visible:=ivNever;  // масштаб для ЭКГ - вертикальный
  dxBarSubItem8.Visible:=ivNever;  // масштаб для ЭКГ - горизонтальный
  dxBarButton27.Visible:=ivNever;  // печать ЭКГ
  dxBarButton28.Visible:=ivNever;  // Фильтр Савицкого
  dxBarSubItem9.Visible:=ivNever;  // Настройки (цвет, шрифт, ...)
  dxBarButton29.Visible:=ivNever;  // отметка куска ЭКГ
  dxBarButton32.Visible:=ivNever;  // QRS
  bbMPR.Visible:=ivNever;          // MPR
  bbScreen.Visible:=ivNever;       // разбивка экрана
  dxBarSubItem10.Visible:=ivNever;
  dxBarButton35.Visible:=ivNever;
  dxBarButton37.Visible:=ivNever;

  DicomMV.Height:=1;
  DicomMV.Width:=1;
  DicomMV.top:=0;
  DicomMV.Left:=0;
  DicomMV.Align := alNone;
  DicomMV.Visible := False;

  scrBox.Height:=1;
  scrBox.Width:=1;
  scrBox.top:=0;
  scrBox.Left:=0;
  scrBox.Visible := False ;
  if CheckPDF then  
    wbPDF.Show
  else
    MessageDlg(cPDFErr, mtWarning, [mbOK], 0);
  Result:=v_pdf_filename;
end;

procedure TMultiForms.PreviewECG;
begin
  // инициализация пунктов меню по раскраске ЭКГ
  btnShapeIniColor;

  DicomMV.Height:=1;
  DicomMV.Width:=1;
  DicomMV.top:=0;
  DicomMV.Left:=0;
  DicomMV.Align := alNone;
  scrBox.Align := alClient;
  scrBox.Visible:=True;
  img1.Visible:=True;
  // отрисовка ЭКГ
  set_ECG_Zoom;
  //pECGdraw ( CnsDMTable1, img1, 25, 10 );
  dxBarButton42.Visible:=ivNever;
  dxBarButton43.Visible:=ivNever;
  dxBarButton44.Visible:=ivNever;
  dxBarSubItem3.Visible:=ivAlways; // масштаб для ЭКГ - вертикальный
  dxBarSubItem8.Visible:=ivAlways; // масштаб для ЭКГ - горизонтальный
  dxBarButton27.Visible:=ivAlways;  // печать ЭКГ
  dxBarButton28.Visible:=ivNever;       //ivAlways;  // Фильтр Савицкого
  dxBarSubItem9.Visible:=ivAlways;  // Настройки (цвет, шрифт, ...)
  dxBarButton29.Visible:=ivAlways;  // отметка куска ЭКГ
  dxBarButton32.Visible:=ivAlways;  // QRS
  bbMPR.Visible:=ivNever;          // MPR
  bbScreen.Visible:=ivNever;       // разбивка экрана
  frmSnimki.BMBar2.Visible := False;
  dxBarSubItem10.Visible:=ivAlways;
  dxBarButton35.Visible:=ivAlways;
  dxBarButton37.Visible:=ivAlways;
end;

function TMultiForms.PreviewSR : ansistring;
begin
  v_pdf_filename := PDUTempPath+'\'+inttostr(GetTickCount)+'.html' ;
  if frmSnimki.v_is_log then
    MnLg_ev( 'Try to use file : '+
             v_pdf_filename ,
             ExtractFilePath(paramstr(0))+'c_move.log',
             False );
  pFrmStructuredReportWebBrowserFrm ( CnsDMTable1[DicomMV.CurrentImage],   
                                      v_pdf_filename,
                                      wbPDF );
  if CheckPDF then  
    wbPDF.Show
  else
    MessageDlg(cPDFErr, mtWarning, [mbOK], 0);
  wbPDF.Align := alClient;
  wbPDF.Navigate( v_pdf_filename );
  dxBarButton42.Visible:=ivNever;
  dxBarButton43.Visible:=ivNever;
  dxBarButton44.Visible:=ivNever;
  dxBarSubItem3.Visible:=ivNever;  // масштаб для ЭКГ - вертикальный
  dxBarSubItem8.Visible:=ivNever;  // масштаб для ЭКГ - горизонтальный
  dxBarButton27.Visible:=ivNever;  // печать ЭКГ
  dxBarButton28.Visible:=ivNever;  // Фильтр Савицкого
  dxBarSubItem9.Visible:=ivNever;  // Настройки (цвет, шрифт, ...)
  dxBarButton29.Visible:=ivNever;  // отметка куска ЭКГ
  dxBarButton32.Visible:=ivNever;  // QRS
  bbMPR.Visible:=ivNever;          // MPR
  bbScreen.Visible:=ivNever;       // разбивка экрана
  dxBarSubItem10.Visible:=ivNever;
  dxBarButton35.Visible:=ivNever;
  dxBarButton37.Visible:=ivNever;

  Result:=v_pdf_filename;
end;

procedure TMultiForms.PreviewCmn;
begin
  dxBarSubItem3.Visible:=ivNever;  // масштаб для ЭКГ - вертикальный
  dxBarSubItem8.Visible:=ivNever;  // масштаб для ЭКГ - горизонтальный
  dxBarButton27.Visible:=ivNever;  // печать ЭКГ
  dxBarButton28.Visible:=ivNever;  // Фильтр Савицкого
  dxBarSubItem9.Visible:=ivNever;  // Настройки (цвет, шрифт, ...)
  dxBarButton29.Visible:=ivNever;  // отметка куска ЭКГ
  dxBarButton32.Visible:=ivNever;  // QRS
  dxBarSubItem10.Visible:=ivNever;
  dxBarButton35.Visible:=ivNever;
  dxBarButton37.Visible:=ivNever;
  DicomMV.Align:=alClient;  // DicomMV.Visible;
  DicomMV.Visible:=True;
  DicomMV.Update;
  img1.Visible:=False;
  scrBox.Visible:=False;
  wbPDF.Hide;
end;

function TMultiForms.PreviewBeforeCmn : string;
begin
  try
    if ((CnsDMTable1.count=0) or (CnsDMTable1[DicomMV.CurrentImage].Attributes=nil)) then
      Result := 'UDF'
    else
      Result := CnsDMTable1[DicomMV.CurrentImage].Attributes.GetString( $8, $60 ) ;
  except
    Result := 'UDF';
  end;
  img1.Visible:=False;
  scrBox.Visible:=False;
  wbPDF.Hide;
//  DicomMV.Visible:=False;
  wbPDF.Top:=0;
  wbPDF.Left:=0;
  wbPDF.Width:=0;
  wbPDF.Height:=0;
end;

end.
