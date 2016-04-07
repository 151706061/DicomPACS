unit fSnimki;

{ Модуль для отображения снимков.
  Использование :
  v_pid_lst : TStringList; - список patientID
  v_sel_rec : array of t_p_pid_list_rec;
    type t_p_pid_list_rec = record
      P_ENAME,
      P_PID,
      STUDYUID,
      ACCESSIONNUMBER : string;
    end;
    // структура MDFolderFullList
          FieldByName('P_ENAME').AsString := das1.Attributes.GetString(dPatientName);
          FieldByName('P_ENAME_RUS').AsString := TranslitEng(FieldByName('P_ENAME').AsString);
          FieldByName('P_DATEBORN').AsString := das1.Attributes.GetString(dPatientBirthDate);
          FieldByName('P_SEX').AsString := gt_sex(das1.Attributes.GetString(dPatientSex));
          FieldByName('LDATE').AsString := das1.Attributes.GetString(dStudyDate);
          FieldByName('P_PID').AsString := das1.Attributes.GetString(dPatientID);
          FieldByName('STUDYUID').AsString := das1.Attributes.GetString(dStudyInstanceUID);
          FieldByName('STUDYID').AsString := das1.Attributes.GetString(dStudyID);
          FieldByName('CNT').AsInteger := 1;
          FieldByName('STUDIES_IMAGE_TYPE').AsString := das1.Attributes.GetString(dModality);
          FieldByName('ACCESSIONNUMBER').AsString := das1.Attributes.GetString(dAccessionNumber);
          FieldByName('VDESC').AsString           := das1.Attributes.GetString(dStudyDescription);
          FieldByName('FILENAME').AsString := p_filename;  // наименование файла для загрузки
          TBlobField(FieldByName('ffile')).LoadFromFile(p_filename);



      Application.CreateForm(TfrmSnimki, frmSnimki);
    case pcMain.ActivePageIndex of
    0: frmSnimki.v_pr_data_fr := 0;   // архив     - C_GET
    3: frmSnimki.v_pr_data_fr := 1;   // из папки  - из MDFolderFullList
    2: frmSnimki.v_pr_data_fr := 2;   // удаленная база - C_MOVE
    end;
    if v_pid_lst.Count > 0 then
      begin
        frmSnimki.DoShowForm_P_PID(v_pid_lst,
                                   v_sel_rec,
                                   v_max_amm2,
                                   frmMain.MDFolderFullList,
                                   frmMain.trRead,
                                   frmMain.DB,
                                   frmMain.sIP,
                                   frmMain.sPort,
                                   frmMain.sCalledAETitle,
                                   frmMain.sCallingAETitle,
                                   frmMain.sUser,
                                   p_key,
                                   frmMain.v_isnot_show_3d_loc;  // True - не отображать 3D меню и не загружать dll 3D обработки
                                   p_isPostgres : Boolean = False; // если true то работаем с Postgres
                                   p_PGconn: TUniConnection = nil;
                                   p_MnUniTransaction : TUniTransaction = nil  );
        frmSnimki.Visible:=False;
        if v_exit_progressbar<>1 then // не было отмены пользователем загрузки
          frmSnimki.ShowModal;
      end;

  

  Сервер при получении снимков добавляет их в датасеты:
  // добавили снимок в датасет
  v_LCnsDMTable1.Add(ADataset);
  v_LCnsDMTable2.Add(ADataset);
  и прорисовывает ползунок :
  FrmProgressBar.MyIncPos('Загрузка снимка ' +
                  inttostr(v_amm_img_loaded)+'/'+inttostr(MoveImageCount));



}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxSkinsCore, dxSkinsDefaultPainters, cxControls,
  cxSplitter, DCM32, Dcm_View, DCM_Attributes, DCM_Client, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer, cxEdit, cxCheckBox, jpeg, DCM_DICT,
  dxSkinscxPCPainter, cxPC, cxGroupBox, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxLabel, DCM_UID, cxPropertiesStore, cxGraphics, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, ActnList, pFIBDataSet, cxTrackBar, cxMemo,
  frxClass, Printers, V3DRenWindow, DCM_MPR, dxSkinOffice2007Green,
  cxProgressBar, KXString, KXServerCore, DCM_Server, DICOM_CMN, pFIBDatabase,
  DCM_ImageData_Bitmap, DCM_MemTable, ImgList, dxSkinsdxNavBar2Painter,
  cxClasses, dxNavBarBase, dxNavBarCollns, dxNavBar, dxSkinBlack,
  dxSkinsdxBarPainter, dxBar, dxBarExtItems, cxBarEditItem, DB, dxmdaset,
  dxSkinOffice2007Black, IniFiles, Uni, Medotrade, frxDBSet, fCD, ComCtrls;

type
  TfrmSnimki = class(TForm)
    CnsDMTable1: TCnsDMTable;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    cxPropertiesStore1: TcxPropertiesStore;
    paMain: TPanel;
    al: TActionList;
    aPriorSeries: TAction;
    aNextSeries: TAction;
    aPriorImage: TAction;
    aNextImage: TAction;
    sdFile: TSaveDialog;
    OpenDialog3: TOpenDialog;
    aClose: TAction;
    aPrint: TAction;
    aLoad: TAction;
    SaveDialog1: TSaveDialog;
    OpenDialog4: TOpenDialog;
    actLoadFiles: TAction;
    cxPageImages: TcxPageControl;
    cxPageControl1: TcxPageControl;
    cxSplitter2: TcxSplitter;
    MainTabSheet: TcxTabSheet;
    MenuImgs: TcxImageList;
    Panel1: TPanel;
    BM: TdxBarManager;
    pmSave: TdxBarPopupMenu;
    bbSaveKadr: TdxBarLargeButton;
    bbSaveStudy: TdxBarLargeButton;
    bbAll: TdxBarLargeButton;
    BMBar2: TdxBar;
    dxBarDockControl2: TdxBarDockControl;
    bbOpen: TdxBarLargeButton;
    bbCursors: TdxBarLargeButton;
    bbMan: TdxBarLargeButton;
    bbMes: TdxBarLargeButton;
    bbClose: TdxBarLargeButton;
    pmOpen: TdxBarPopupMenu;
    bbOpenFile: TdxBarButton;
    bbOpenFolder: TdxBarButton;
    pmSend: TdxBarPopupMenu;
    bbSendKadr: TdxBarButton;
    bbSendAll: TdxBarButton;
    bbSendStudy: TdxBarButton;
    pmExpImp: TdxBarPopupMenu;
    bbExp: TdxBarButton;
    bbImp: TdxBarButton;
    pmCursors: TdxBarPopupMenu;
    bbDefault: TdxBarButton;
    bbMag: TdxBarButton;
    bbDrag: TdxBarButton;
    pmMan: TdxBarPopupMenu;
    bbInvert: TdxBarButton;
    bbHorizontal: TdxBarButton;
    bbVertical: TdxBarButton;
    bbMagArea: TdxBarButton;
    bbLupa: TdxBarButton;
    bb90Left: TdxBarButton;
    bb90Right: TdxBarButton;
    bbDef: TdxBarButton;
    bbLut: TdxBarButton;
    pmRules: TdxBarPopupMenu;
    bbLine: TdxBarButton;
    bbLineW: TdxBarButton;
    bbLineH: TdxBarButton;
    bbLineHW: TdxBarButton;
    bbCircle: TdxBarButton;
    bbHWRect: TdxBarButton;
    bbPlot: TdxBarButton;
    bbDiag: TdxBarButton;
    bbAngle: TdxBarButton;
    bbRect: TdxBarButton;
    bbArea: TdxBarButton;
    bbCross: TdxBarButton;
    bbArrow: TdxBarButton;
    bbText: TdxBarButton;
    bbSaveR: TdxBarButton;
    bbLoadR: TdxBarButton;
    bbClearR: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    bbTags: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    pm3D: TdxBarPopupMenu;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    bbActive3d: TdxBarButton;
    bbXY: TdxBarButton;
    FileOpenDialogDCM: TFileOpenDialog;
    Keyboard_Del: TAction;
    bbRulers: TdxBarButton;
    bbKalibr: TdxBarButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    bbFilterIzm: TdxBarButton;
    dxbrsprtr1: TdxBarSeparator;
    DicomServerCore1: TDicomServerCore;
    dxBarButton9: TdxBarButton;
    mdPrintList: TdxMemData;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    dsPrintList: TDataSource;
    dbPrintList: TfrxDBDataset;
    frxReport1: TfrxReport;
    dxBarButton10: TdxBarButton;
    dxBarLargeButton4: TdxBarLargeButton;
    aHelp: TAction;
    procedure DicomMVAfterNewDrawObject(Sender: TObject;
      AObject: TDicomDrawObject);
    procedure DicomMVAfterObjectMove(Sender: TObject;
      AObject: TDicomDrawObject);
    procedure DicomMVAfterObjectSize(Sender: TObject;
      AObject: TDicomDrawObject);
    procedure bSendAllClick(Sender: TObject);
    procedure cxTrackBar1PropertiesChange(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure DicomMultiViewer1AfterNewDrawObject(Sender: TObject;
      AObject: TDicomDrawObject);
    procedure DicomMultiViewer1AfterObjectMove(Sender: TObject;
      AObject: TDicomDrawObject);
    procedure DicomMultiViewer1AfterObjectSize(Sender: TObject;
      AObject: TDicomDrawObject);
    procedure FormCreate(Sender: TObject);
    procedure DCMMultiImage1MultiImageScrollTo1(Sender: TObject; AIndex: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure MyCnsDicomConnection1CGETProcess(Sender: TObject;
      ADataset: TDicomAttributes; AImageCount: Integer);
    procedure DCMMultiImage1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DCMMultiImage1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DCMMultiImage1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxtbshtPac1Show(Sender: TObject);
    procedure cxPageControl1CanClose(Sender: TObject; var ACanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure cxSplitter2BeforeOpen(Sender: TObject; var NewSize: Integer;
      var AllowOpen: Boolean);
    procedure cxSplitter2BeforeClose(Sender: TObject; var AllowClose: Boolean);
    procedure cxSplitter2AfterClose(Sender: TObject);
    procedure cxSplitter2AfterOpen(Sender: TObject);
    procedure cxSplitter2CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure cxPageControl1Change(Sender: TObject);
    procedure bbSaveKadrClick(Sender: TObject);
    procedure bbSaveStudyClick(Sender: TObject);
    procedure bbAllClick(Sender: TObject);
    procedure bbDefaultClick(Sender: TObject);
    procedure bbDragClick(Sender: TObject);
    procedure bbMagClick(Sender: TObject);
    procedure bbOpenFileClick(Sender: TObject);
    procedure bbOpenFolderClick(Sender: TObject);
    procedure bbSendKadrClick(Sender: TObject);
    procedure bbSendAllClick(Sender: TObject);
    procedure bbExpClick(Sender: TObject);
    procedure bbImpClick(Sender: TObject);
    procedure bbLupaClick(Sender: TObject);
    procedure bbMagAreaClick(Sender: TObject);
    procedure bbVerticalClick(Sender: TObject);
    procedure bbHorizontalClick(Sender: TObject);
    procedure bb90LeftClick(Sender: TObject);
    procedure bb90RightClick(Sender: TObject);
    procedure bbLutClick(Sender: TObject);
    procedure bbDefClick(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure bbTagsClick(Sender: TObject);
    procedure bbLineClick(Sender: TObject);
    procedure bbLineHClick(Sender: TObject);
    procedure bbLineWClick(Sender: TObject);
    procedure bbLineHWClick(Sender: TObject);
    procedure bbCrossClick(Sender: TObject);
    procedure bbAreaClick(Sender: TObject);
    procedure bbCircleClick(Sender: TObject);
    procedure bbRectClick(Sender: TObject);
    procedure bbAngleClick(Sender: TObject);
    procedure bbDiagClick(Sender: TObject);
    procedure bbPlotClick(Sender: TObject);
    procedure bbHWRectClick(Sender: TObject);
    procedure bbArrowClick(Sender: TObject);
    procedure bbTextClick(Sender: TObject);
    procedure bbSaveRClick(Sender: TObject);
    procedure bbLoadRClick(Sender: TObject);
    procedure bbClearRClick(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure dxBarButton8Click(Sender: TObject);
    procedure dxBarButton7Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure bbActive3dClick(Sender: TObject);
    procedure bbInvertClick(Sender: TObject);
    procedure bbXYClick(Sender: TObject);
    procedure bbSendStudyClick(Sender: TObject);
    procedure Keyboard_DelExecute(Sender: TObject);
    procedure bbRulersClick(Sender: TObject);
    procedure bbKalibrClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure bbFilterIzmClick(Sender: TObject);
    procedure DicomServerCore1DicomImage(AClientThread: TDicomClientThread;
      AAddress: string; ADataset: TDicomDataset);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    procedure dxBarButton10Click(Sender: TObject);
    procedure aHelpExecute(Sender: TObject);
  private
    frotalImage: integer;
    FlipVer, FlipHor : Boolean;
    FX, FY: Integer;
    //
    V_ENAME,
    V_PID,
    V_SEX,
    V_DATEBORN,
    VAccessionNumber,
    VStartDateWorklist : string;
  protected
    Procedure WMMove(Var Message : TWMMove); message WM_Move;
  public
    // параметры задаваемые при вызове
    v_MytrRead: TpFIBTransaction;
    v_MyDB: TpFIBDatabase;
    v_sIP,
    v_sPort,
    v_sCalledAETitle,
    v_sCallingAETitle,
    v_sUser : string;
    //
    v_is_start_dicom_server,
    v_started : Boolean;
    // признак протоколирования запросов
    v_logfile : string;
    v_is_log ,
    // для перерисовки экрана
    v_is_calibr ,
    v_is_frm : Boolean;
    v_pr_data_fr : Integer; // откуда брать данные 0 - с пакса get'ом  1 - из массивов
    v_is_main_form,
    v_is_stlViewer : boolean;
    vPdfFiles : TStringList;
    procedure DoShowForm_P_PID ( p_pid : TStringList;
                                 p_sel_rec : array of t_p_pid_list_rec;
                                 p_amm : integer;
                                 p_MDFolderFullList : TdxMemData = nil;
                                 p_trRead : TpFIBTransaction = nil;
                                 p_DB : TpFIBDatabase = nil;
                                 p_sIP : string = '';
                                 p_sPort : string = '';
                                 p_sCalledAETitle : string = '';
                                 p_sCallingAETitle : string = '';
                                 p_sUser : string = '';
                                 p_key  : Boolean = False;
                                 p_not_use_3d : Boolean = False;
                                 p_isPostgres : Boolean = False; // если true то работаем с Postgres
                                 p_PGconn: TUniConnection = nil;
                                 p_MnUniTransaction : TUniTransaction = nil
                               ); // вид вызова 1-для МИС "Пациент", 2-для ПАКС
    procedure SetFirstActive;
    procedure p_action_frm;
    procedure kb_ini;
    procedure MyStopVideo;
    procedure ParamsViewerIni;
    function chkLog : Boolean;
    procedure LogWrt ( p_str : string );
  end;

// описание класса
type TMyTabSheet = class (TcxTabSheet)
  private
  protected
  public
    vmn_tabsheet_table: TCnsDMTable;
    vmn_Panel         : TPanel;
    vmn_DCMMultiImage : TDCMMultiImage;
end;

// начальное значение для позиции мышки при вычислении смещения
const c_fx_ini = -10;
      c_fy_ini = -10;

procedure LdImg ( const p_isfolder : Boolean = False );
procedure LdImages ( v_s2 : TStringList );
procedure p_act_window;
procedure SetInvisible3D;

var frmSnimki: TfrmSnimki;
  v_objList, v_forms_list,
  v_multiview_list,
  v_Snimki, v_cns_tables, vFrgECG : TList;
  v_multiimages_height : Integer;
  // для отмены повторного вызова перерисовки окна
  v_is_move : Boolean;
  // код действия, по выбору меню (0-без действия)
  v_action_frm, v_n_obj, vNFrgECG : integer;
  // признак начала операции C_MOVE
  v_is_moveDCM : Boolean;
  // таблицы куда складывается результат C_MOVE
  v_LCnsDMTable1: TCnsDMTable;
  v_LCnsDMTable2: TCnsDMTable;

  v_is_Exit,
  // признак показывать ли 3D меню - необходима dll
  v_isnot_show_3d ,
  v_is_show_err_msg_ld_files : Boolean;

var  v_aetitle_viewer  ,
     v_ip_viewer       ,
     v_local_ae_viewer : string;
     v_port_viewer     : Integer;

implementation

uses CnsJpgGr, CnsTifGr, CnsPngGr, CnsPcxGr, CnsPpmGr, CnsTgaGr,
     DCM_MpegWrite, Save2MpegStatus, Dicom2AVIStatus, DB_CMN,
     Mpr3DUnit, UnFrmProgressBar, CmnUnit, SurfaceRenderEx,
     DCM_Connection, Registry, fCine, UnMultiFormsFrame,
     VolumeRenderingEx, fSendParam, UnFrmEcgFrag;

{$R *.dfm}
{$R MyPic.RES}    // мини-картинки по модальностям

procedure SetInvisible3D;
begin
  frmSnimki.dxBarLargeButton1.Visible:=ivNever;
  V3DRenWindow.v_is_not_load_3d_dll:=v_isnot_show_3d;
end;

function TfrmSnimki.chkLog : Boolean;
begin
  if frmSnimki.v_logfile='' then
    frmSnimki.v_logfile:=ExtractFilePath(Application.ExeName)+'fSnimki.log';
  Result := frmSnimki.v_is_log;
end;

procedure TfrmSnimki.LogWrt ( p_str : string );
begin
  if chkLog then  
    MnFl_ev ( p_str, frmSnimki.v_logfile );
end;

procedure TfrmSnimki.MyStopVideo;
var i:integer; v_EmpFrm:TMultiForms;
begin
  try
    for I := 0 to fSnimki.v_forms_list.Count - 1 do
    begin
      v_EmpFrm:=(TWinControl(fSnimki.v_forms_list[i]) as TMultiForms);
      if v_EmpFrm.Timer1.Enabled then v_EmpFrm.Timer1.Enabled:=False;
      v_EmpFrm.CnsDMTable1.Clear;
      v_EmpFrm.PresentationStateDS.Clear;
    end;
  except
  end;
end;

procedure TfrmSnimki.SetFirstActive;
var i:Integer;
    v_EmpFrm : TMultiForms;
begin
  // сделаем активным 1-е окно
  if fSnimki.v_forms_list.Count>0 then
  begin
    for I := 0 to fSnimki.v_forms_list.Count - 1 do
    begin
      v_EmpFrm:=(TWinControl(fSnimki.v_forms_list[i]) as TMultiForms);
      if v_EmpFrm.DicomMV.Visible then
        if v_EmpFrm.v_is_visible and not v_EmpFrm.v_is_hide then
        begin
          v_EmpFrm.DicomMV.ActiveView.SetFocus;
          v_EmpFrm.WMNCPaint(True);
          bbInvert.Down := v_EmpFrm.v_is_negative;
          bbTags.Down   := v_EmpFrm.DicomMV.ActiveView.DisplayLabel;
          bbRulers.Down := v_EmpFrm.DicomMV.ActiveView.DisplayRuler;
          bbXY.Down     := v_EmpFrm.v_is_xy;
          Break;
        end;
    end;
  end;
end;

procedure TfrmSnimki.cxPageControl1CanClose(Sender: TObject;
  var ACanClose: Boolean);
var i:Integer; v_EmpFrm:TMultiForms;
begin // Close TabSheet
  // цикл по всем окнам приложения и деактивация
  for I := 0 to fSnimki.v_forms_list.Count - 1 do
  begin
    v_EmpFrm:=(TWinControl(fSnimki.v_forms_list[i]) as TMultiForms);
    if v_EmpFrm.vp_tabsheet=
      (frmSnimki.cxPageControl1.Pages[cxPageControl1.ActivePageIndex] as TcxTabSheet) then
    begin
      // посчитаем кол-во закладок вверху, посчитаем кол-во неудаленных формочек
      if ((clc_amm_frm=1) and ((frmSnimki.cxPageControl1.PageCount>=1))) then
      begin // если осталась 1 формочка - обнуляем dataset в ней
        v_EmpFrm.CnsDMTable1.ClearList;
        v_EmpFrm.DicomMV.DicomDatasets.ClearList;
        v_EmpFrm.DicomMV.Update;
        // инициализируем переменные
        v_EmpFrm.vp_P_PID            := ''; // P_PID пациента
        v_EmpFrm.vp_StudyInstanceUID := ''; // STUDYUID
      end else
      begin
        v_EmpFrm.Visible:=False;
        v_EmpFrm.v_is_visible:=False;
      end;
    end;
  end;
  FrmSnimkiRefr;
end;

procedure TfrmSnimki.cxPageControl1Change(Sender: TObject);
begin
  // если осталась одна закладка - сделаем ее невидимой
  if (frmSnimki.cxPageControl1.PageCount=1)
  and v_is_frm
  then
    frmSnimki.cxPageControl1.HideTabs:=True;
end;

procedure TfrmSnimki.cxSplitter2AfterClose(Sender: TObject);
begin
  // перерисовка всех формочек
  FrmSnimkiRefr;
end;

procedure TfrmSnimki.cxSplitter2AfterOpen(Sender: TObject);
begin
  // перерисовка всех формочек
  FrmSnimkiRefr;
end;

procedure TfrmSnimki.cxSplitter2BeforeClose(Sender: TObject;
  var AllowClose: Boolean);
begin
  Panel1.Visible := False;
end;

procedure TfrmSnimki.cxSplitter2BeforeOpen(Sender: TObject;
  var NewSize: Integer; var AllowOpen: Boolean);
begin
  Panel1.Visible := True;
end;

procedure TfrmSnimki.cxSplitter2CanResize(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
begin
  Accept:=False;
end;

procedure TfrmSnimki.cxtbshtPac1Show(Sender: TObject);
var i:Integer;
    v_frame : TMultiForms;
    v_cxTabSheet:TcxTabSheet;
begin  //
  if (TWinControl(Sender) is TcxTabSheet) then
  begin
    v_cxTabSheet:=(TWinControl(Sender) as TcxTabSheet);
    for I := 0 to fSnimki.v_forms_list.Count - 1 do begin
      v_frame:=(TWinControl(fSnimki.v_forms_list[i]) as TMultiForms);
      if ( v_frame.Parent = v_cxTabSheet ) then
      begin
        v_frame.WMNCPaint(v_frame.v_is_selected);
      end;
    end;
  end;
end;

procedure TfrmSnimki.cxTrackBar1PropertiesChange(Sender: TObject);
begin
//  DicomMV.ActiveView.Scale := cxTrackBar1.Position;
//  DicomMV.ActiveView.OffsetHorz := (DicomMV.ActiveView.Width - DicomMV.ActiveView.Bitmap.Width * DicomMV.ActiveView.Scale) / cxTrackBar1.Position;
//  DicomMV.ActiveView.OffsetVert := (DicomMV.ActiveView.Height - DicomMV.ActiveView.Bitmap.Height * DicomMV.ActiveView.Scale) / cxTrackBar1.Position;
end;

procedure TfrmSnimki.MyCnsDicomConnection1CGETProcess(Sender: TObject;
  ADataset: TDicomAttributes; AImageCount: Integer);
begin  //
  FrmProgressBar.MyIncPos;
  if CmnUnit.v_exit_progressbar=1 then
  begin
    MyDisconnectAssociation( (Sender as TCnsDicomConnection) );
  end;
  //
end;

procedure TfrmSnimki.bSendAllClick(Sender: TObject);
begin

end;

// 26.07.2012 FOMIN
procedure TfrmSnimki.aCloseExecute(Sender: TObject);
begin
  kb_ini;
  MyStopVideo;
  if Assigned(frmCine) then
    try
      frmCine.Close;
    except
    end;
  if frmSnimki.v_is_main_form then
    Application.Terminate
  else
    ModalResult := mrCancel;
end;

procedure MI_events_set ( const p_is_set : Boolean;
                          const p_DCMMultiImage : TDCMMultiImage
                        );
begin
  if p_is_set then begin
    p_DCMMultiImage.OnMouseDown          := frmSnimki.DCMMultiImage1MouseDown;
    p_DCMMultiImage.OnMouseUp            := frmSnimki.DCMMultiImage1MouseUp;
    p_DCMMultiImage.OnMouseMove          := frmSnimki.DCMMultiImage1MouseMove;
    //
    p_DCMMultiImage.OnMultiImageScrollTo := frmSnimki.DCMMultiImage1MultiImageScrollTo1;
//    p_DCMMultiImage.OnScroll             := frmSnimki.DCMMultiImage1Scroll1;
  end else begin
    p_DCMMultiImage.OnMouseDown          := nil;
    p_DCMMultiImage.OnMouseUp            := nil;
    p_DCMMultiImage.OnMouseMove          := nil;
    //
    p_DCMMultiImage.OnMultiImageScrollTo := nil;
    p_DCMMultiImage.OnScroll             := nil;
  end;
end;

procedure LdImages ( v_s2 : TStringList );
var i, i11, ii : Integer;
    v_CnsDMTable_tmp : TCnsDMTable;
    das1: TDicomDataset;
    v_fn : Boolean;
    v_pid_lst : TStringList;
    v_cxTabSheet : TMyTabSheet;
    v_CnsDMTable1 : TCnsDMTable;
    v_Panel : TPanel;
    v_DCMMultiImage : TDCMMultiImage;
    v_MyForm : TMultiForms;
var vStudyFnd : Boolean; i2 : Integer;    
begin
  Application.CreateForm(TFrmProgressBar, FrmProgressBar);
        // сбросим признак новой формы в формочках
        for i := 0 to v_Snimki.Count - 1 do
          (TWinControl(v_Snimki[i]) as TMultiForms).v_is_new:=False;
        try
          CmnUnit.v_exit_progressbar:=0;
          // инициализируем ползунок - чтобы что-то показать
          FrmProgressBar.clc_pos( False, // is_on_top
                      'Открытие файла DICOM',
                      v_s2.Count, // кол-во
                      True   // один ползунок
                    );
          FrmProgressBar.clc_posMain( v_s2.Count, // 0-не отображать ползунок
                        'Открытие файла DICOM',
                         True
                      );
          // инициализация переменных для ползунка
          MyIniMove;
          // загрузка снимков из списка файлов v_s2
          for i := 0 to v_s2.Count - 1 do
          begin
            FrmProgressBar.MyIncPos('Открытие файлов ' +
                       ' DICOM '+inttostr(i+1)+'/'+inttostr(v_s2.Count));
            if CmnUnit.v_exit_progressbar=1 then Break;
            v_CnsDMTable_tmp := TCnsDMTable.Create(nil);
            try
              try
                v_CnsDMTable_tmp.LoadFromFile(v_s2[i]);
                das1:=v_CnsDMTable_tmp[0];
                // проверка что в снимке что-то есть - непустая запись
                if ((Trim(das1.Attributes.GetString(dPatientName))<>'') or
                    (Trim(das1.Attributes.GetString(dStudyInstanceUID))<>'') or
                    (Trim(das1.Attributes.GetString(dAccessionNumber))<>'') or
                    (Trim(das1.Attributes.GetString(dModality))<>'') or
                    (Trim(das1.Attributes.GetString(dPatientID))<>''))
                then
                begin
                  // проверим есть ли среди новых формочек
                  v_fn:=False;
                  for i11 := 0 to v_Snimki.Count - 1 do
                  begin
                    if (TWinControl(v_Snimki[i11]) as TMultiForms).v_is_new and
                      (das1.Attributes.GetString(dStudyInstanceUID)=(TWinControl(v_Snimki[i11]) as TMultiForms).vp_StudyInstanceUID)
                    then
                    begin
                      // нашли - просто добавим в окошко и в панельку
                      // по пациенту
                      (TWinControl(v_Snimki[i11]) as TMultiForms).vp_CnsDMTablePID.Add(das1);
                      // по исследованию
                      (TWinControl(v_Snimki[i11]) as TMultiForms).CnsDMTable1.Add(das1);
                      v_fn:=True;
                      Break;
                    end;
                  end;
                  if not v_fn then
                  begin
                    // не нашли - создаем заново
                    // ищем вверху закладку по пациенту
                    v_fn:=False;
                    for i11 := 0 to v_Snimki.Count - 1 do
                    begin
                      if (TWinControl(v_Snimki[i11]) as TMultiForms).v_is_new and
                        (das1.Attributes.GetString(dPatientID)=(TWinControl(v_Snimki[i11]) as TMultiForms).vp_P_PID)
                      then
                      begin
                        v_CnsDMTable1:=(TWinControl(v_Snimki[i11]) as TMultiForms).vp_CnsDMTablePID;
                        v_cxTabSheet    := (TWinControl(v_Snimki[i11]) as TMultiForms).vp_tabsheet ;
                        v_Panel         := (TWinControl(v_Snimki[i11]) as TMultiForms).vp_Panel ;
                        v_DCMMultiImage := (TWinControl(v_Snimki[i11]) as TMultiForms).vp_DCMMultiImage ;
                        v_fn:=True;
                        Break;
                      end;
                    end;
                    if not v_fn then
                    begin
                      // создадим закладку вверху
                      v_cxTabSheet := TMyTabSheet.Create(frmSnimki);
                      v_cxTabSheet.PageControl := frmSnimki.cxPageControl1;
                      v_cxTabSheet.OnShow := frmSnimki.cxtbshtPac1Show;
                      if das1.Attributes.GetString(dPatientName)='' then
                        v_cxTabSheet.Caption := '_____'
                      else
                        v_cxTabSheet.Caption := das1.Attributes.GetString(dPatientName);
                      // table
                      v_CnsDMTable1 := TCnsDMTable.Create(nil);
                      v_objList.Add(v_CnsDMTable1); // очищаем руками ...
                      v_cns_tables.Add(v_CnsDMTable1);
                      v_cxTabSheet.vmn_tabsheet_table:=v_CnsDMTable1;
                      v_cxTabSheet.PageControl.HideTabs:=False;
                      // -------------------------------------------------------------------------
                      // создадим прокрутку вверху
                      // TPanel
                      v_Panel := TPanel.Create(frmSnimki);
                      v_Panel.Parent:=v_cxTabSheet;
                      v_Panel.Caption:='';
                      v_Panel.Align:=alClient;
                      v_cxTabSheet.vmn_Panel         := v_Panel;
                      // DCMMultiImage - в panel  вверху
                      v_DCMMultiImage := TDCMMultiImage.Create(frmSnimki);
                      v_DCMMultiImage.Parent:=v_Panel;  // поместим в панель
                      v_DCMMultiImage.Align:=alClient;
                      v_DCMMultiImage.Color:=clBlack;
                      v_DCMMultiImage.GridVisible:=True;
                      v_DCMMultiImage.ParentColor:=False;
                      v_DCMMultiImage.ParentShowHint:=False;
                      v_DCMMultiImage.ShowHint:=True;
                      v_DCMMultiImage.ShowSeriesDescription:=True;
                      v_DCMMultiImage.DicomDatasets:=v_CnsDMTable1;
                      //
                      v_DCMMultiImage.ViewGridMode := vgmSeriesGrid;
                      v_DCMMultiImage.AutoChangeSeriesMode := False;
                      //
                      v_DCMMultiImage.AutoChangeSeriesMode:=False;
                      v_DCMMultiImage.AutoGrid:=True;
                      //
                      v_DCMMultiImage.DragMode:=dmManual; // dmAutomatic;
                      //
                      MI_events_set ( True, v_DCMMultiImage );
                      v_cxTabSheet.vmn_DCMMultiImage := v_DCMMultiImage;
                      //
                      v_multiimages_height:=0;
                    end;
                    // добавим формочку
                    // создадим форму соответствующую STUDY
                    vStudyFnd:=False;
                    for i2 := 0 to v_forms_list.Count - 1 do
                      if TMultiForms( v_forms_list[i2] ).vp_StudyInstanceUID=
                           das1.Attributes.GetString(dStudyInstanceUID)
                      then
                      begin
                        v_MyForm := TMultiForms( v_forms_list[i2] ) ;
                        vStudyFnd:=True;
                        Break;
                      end;
                    if not vStudyFnd then
                    begin
                      v_MyForm                  := TMultiForms.Create(frmSnimki);
                      Inc(v_n_obj);
                      v_MyForm.Name             := 'FRAME'+inttostr(v_n_obj);
                      v_forms_list.Add(v_MyForm);
                      v_Snimki.Add(v_MyForm);
                     // v_MyForm.DicomMV.DicomDatasets:=nil;
                      v_MyForm.Visible          := False;
                      v_MyForm.v_is_visible     := True;
                      v_MyForm.DicomMV.not_show_video := True;           // не показывать управление видео
                      v_MyForm.v_is_full_screen := False;                // признак - развернуть снимок на весь экран
                      v_MyForm.v_is_hide        := False;                // признак временно невидимый при раскрытии какого-то снимка на весь экран
                      v_MyForm.Parent           := frmSnimki.MainTabSheet;
                      v_MyForm.vp_CnsDMTablePID := v_CnsDMTable1;        // CnsDMTable для пациента(закладки) PID
                      v_MyForm.vp_DCMMultiImage := v_DCMMultiImage;      // DCMMultiImage для пациента (закладки)
                      v_MyForm.vp_Panel         := v_Panel;              // панель для DCMMultiImage
                      v_MyForm.vp_P_PID         := das1.Attributes.GetString(dPatientID);              // P_PID пациента
                      v_MyForm.vp_StudyInstanceUID := das1.Attributes.GetString(dStudyInstanceUID);             // STUDYUID
                      v_MyForm.vp_tabsheet      := v_cxTabSheet;         // TabSheet
                      v_MyForm.v_is_negative    := False;                // признак негатива снимка
                      v_multiview_list.Add(v_DCMMultiImage);
                      v_MyForm.v_is_new         := True;
                    end;
                    // добавим снимок в dataset
                    v_CnsDMTable1.Add(das1);
                    v_MyForm.CnsDMTable1.Add(das1);
                    //
                    v_MyForm.DicomMV.LimitOneSeries:=False;
                    v_MyForm.DicomMV.Update;
                    v_DCMMultiImage.Update;
                    //
                  end;
                end;
                // перерисовать и отмасштабировать формочки
                p_act_window;
                // снять полноэкранный режим если необходимо
                for ii := 0 to v_Snimki.Count - 1 do
                begin
                  (TWinControl(v_Snimki[ii]) as TMultiForms).v_is_full_screen := False;
                  (TWinControl(v_Snimki[ii]) as TMultiForms).v_is_hide := False;
                end;
                frmSnimki.cxPageControl1.HideTabs:=(frmSnimki.cxPageControl1.PageCount=1);
              except
                if v_is_show_err_msg_ld_files then                
                  MessageDlg('Ошибка загрузки файла'+#13+v_s2[i], mtError, [mbOK], 0);
              end;
            finally
            //  v_CnsDMTable_tmp.Clear;
            //  v_CnsDMTable_tmp.ClearList;
            //  FreeAndNil(v_CnsDMTable_tmp);
            end;
          end;
        finally                                     
          chk_close;         // закроем ползунок
          FreeAndNil(FrmProgressBar);
        end;
end;

procedure LdImg ( const p_isfolder : Boolean = False );
var i, i11, ii : Integer;
    v_s2 : TStringList;
    v_CnsDMTable_tmp : TCnsDMTable;
    das1: TDicomDataset;
    v_fn : Boolean;
    v_pid_lst : TStringList;
    v_cxTabSheet : TMyTabSheet;
    v_CnsDMTable1 : TCnsDMTable;
    v_Panel : TPanel;
    v_DCMMultiImage : TDCMMultiImage;
    v_MyForm : TMultiForms;
  // ---------------------------------------------------------------------------
  function f_pid_chk (const p_pid:string):Boolean;
  var j:Integer; v_res:Boolean;
  begin
    v_res:=False;
    for j := 0 to v_pid_lst.Count - 1 do
      if v_pid_lst[j]=p_pid then
      begin
        v_res:=True;
        break;
      end;
    f_pid_chk:=v_res;
  end;
  // ---------------------------------------------------------------------------
  var vStudyFnd : Boolean; i2 : Integer;
begin
    try
      v_s2 := TStringList.Create;
      if p_isfolder then begin
        gt_files_dicom_fr_folder(v_s2);
      end
      else
      begin
        frmSnimki.OpenDialog3.Files.Clear;
        if frmSnimki.OpenDialog3.Execute then
        begin
          try
            Screen.Cursor := crHourGlass;
            for i := 0 to frmSnimki.OpenDialog3.Files.Count - 1 do
            begin
              if f_DICOM_file_chk(frmSnimki.OpenDialog3.Files[i]) then
                v_s2.Add(frmSnimki.OpenDialog3.Files[i]);
            end;
          finally
            Screen.Cursor := crDefault;
          end;
        end;
      end;
      // -----------------------------------------------------------------------
      if v_s2.Count>0 then
      begin
        LdImages ( v_s2 );
      end;
    finally
      Freeandnil(v_s2);
    end;
  {  for i11 := 0 to v_Snimki.Count - 1 do
    if (TWinControl(v_Snimki[i11]) as TMultiForms).v_is_new then    
    begin
      (TWinControl(v_Snimki[i11]) as TMultiForms).DicomMV.Update;
      MessageDlg('верх '+IntToStr((TWinControl(v_Snimki[i11]) as TMultiForms).vp_CnsDMTablePID.Count), mtWarning, [mbOK], 0);
      MessageDlg('низ '+IntToStr((TWinControl(v_Snimki[i11]) as TMultiForms).CnsDMTable1.Count), mtWarning, [mbOK], 0);
    end; }
  //p_act_window;  
end;

procedure TfrmSnimki.DicomMultiViewer1AfterNewDrawObject(Sender: TObject;
  AObject: TDicomDrawObject);
begin
  case AObject.Kind of
    ldmiRulerCalc:
      begin
        {if fCurrentCalcMenuItem <> nil then
          if AObject.Name = '' then
          begin
            AObject.Name := fCurrentCalcMenuItem.Caption;
            AObject.Tag := fCurrentCalcMenuItem.Tag;
            fCurrentCalcMenuItem := nil;
            DicomMultiLayoutViewer1.ActiveView.LeaderMouserInspect := ldmiNone;
          end;}
      end;
    ldmiROI_Cycle, ldmiROI_Rect:
      begin
  //      DicomMV.ActiveView.LeaderMouserInspect := ldmiNone;
        //CnsItem80.Checked := false;
        //CnsItem81.Checked := false;
      end;
  else
    begin
      {if fCurrentMeasureMemuItem <> nil then
        if AObject.Name = '' then
        begin
          AObject.Name := fCurrentMeasureMemuItem.Caption;
          AObject.Tag := fCurrentMeasureMemuItem.Tag;
          fCurrentMeasureMemuItem := nil;
          DicomMultiLayoutViewer1.ActiveView.LeaderMouserInspect := ldmiNone;
        end;}
      AObject.CalText := AObject.Calc2Text;
    end;
  end;
//  DicomMV.ActiveView.LeaderMouserInspect := ldmiNone;
  DicomMVAfterObjectSize(Sender, AObject);
end;

procedure TfrmSnimki.DicomMultiViewer1AfterObjectMove(Sender: TObject;
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

procedure TfrmSnimki.DicomMultiViewer1AfterObjectSize(Sender: TObject;
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

procedure TfrmSnimki.DicomMVAfterNewDrawObject(Sender: TObject;
  AObject: TDicomDrawObject);
begin
  case AObject.Kind of
    ldmiRulerCalc:
      begin
        {if fCurrentCalcMenuItem <> nil then
          if AObject.Name = '' then
          begin
            AObject.Name := fCurrentCalcMenuItem.Caption;
            AObject.Tag := fCurrentCalcMenuItem.Tag;
            fCurrentCalcMenuItem := nil;
            DicomMultiLayoutViewer1.ActiveView.LeaderMouserInspect := ldmiNone;
          end;}
      end;
    ldmiROI_Cycle, ldmiROI_Rect:
      begin
  //      DicomMV.ActiveView.LeaderMouserInspect := ldmiNone;
        //CnsItem80.Checked := false;
        //CnsItem81.Checked := false;
      end;
  else
    begin
      {if fCurrentMeasureMemuItem <> nil then
        if AObject.Name = '' then
        begin
          AObject.Name := fCurrentMeasureMemuItem.Caption;
          AObject.Tag := fCurrentMeasureMemuItem.Tag;
          fCurrentMeasureMemuItem := nil;
          DicomMultiLayoutViewer1.ActiveView.LeaderMouserInspect := ldmiNone;
        end;}
      AObject.CalText := AObject.Calc2Text;
    end;
  end;
 // DicomMV.ActiveView.LeaderMouserInspect := ldmiNone;
  DicomMVAfterObjectSize(Sender, AObject);
end;

procedure TfrmSnimki.DicomMVAfterObjectMove(Sender: TObject;
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

procedure TfrmSnimki.DicomMVAfterObjectSize(Sender: TObject;
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

procedure TfrmSnimki.DicomServerCore1DicomImage(
  AClientThread: TDicomClientThread; AAddress: string; ADataset: TDicomDataset);
var v_MemoryStream : TMemoryStream ;
    das: TDicomAttributes;
    daPDF : TDicomAttribute;
begin
  if MoveImageCount=0 then Exit;
  
  {  MnLg_ev('DicomServerDicomImage port='+inttostr(DicomServerCore1.ServerPort)+#13+
          ' AAddress='+AAddress); }
  // проверяем признак принудительного выхода - устанавливается
  // в форме ползунка
  if CmnUnit.v_exit_progressbar=1 then // остановить прием
  begin
    CmnUnit.v_exit_progressbar:=2;  // остановим ползунок
    frmSnimki.DicomServerCore1.Stop;
  end else begin  // прием очередного изображения
    if frmSnimki.v_is_log then
      MnLg_ev('DicomServerDicomImage MoveImageCount '+inttostr(MoveImageCount)+
               ' / curr_count='+inttostr(v_amm_img_loaded),
               ExtractFilePath(paramstr(0))+'c_move.log',
               False );
    // пока принятых снимков меньше общего
    // количества которое ожидается принять
    // добавили снимок в датасет

   {
    daPDF := TDicomAttributes(ADataset).Item[$2006, $0001];
    if Assigned(daPDF) then
    begin
      v_MemoryStream := TMemoryStream.Create ;
      try
        daPDF.SaveToStream(v_MemoryStream);
        ADataset.LoadFromStream(v_MemoryStream);
      finally
        v_MemoryStream.Free;
      end;
    end;  }




    v_LCnsDMTable1.Add(ADataset);
    v_LCnsDMTable2.Add(ADataset);
    // послали сообщение что снимок принят нормально - 0
    AClientThread.Association.SendStatus(0);
   // if v_amm_img_loaded<=MoveImageCount then begin
      inc(v_amm_img_loaded);
//      Sleep(100);
{
ShowMessage('снимков '+IntToStr(MoveImageCount)+#13+
            'текущий '+inttostr(v_amm_img_loaded)
           );   }

//      Application.ProcessMessages;
      // если снимок последний - остановим прием
      if ((v_amm_img_loaded>=MoveImageCount) and (MoveImageCount>=0))
      then
      begin

//         ShowMessage('Данные загружены');

        CmnUnit.v_exit_progressbar:=2;  // остановим ползунок
        frmSnimki.DicomServerCore1.Stop;
      end;
      FrmProgressBar.MyIncPos; // прогрессбар нарастили
   // end;
  end;
end;

procedure TfrmSnimki.DCMMultiImage1MultiImageScrollTo1(Sender: TObject; AIndex: Integer);
var v_DCMMultiImage : TDCMMultiImage;
    v_TT : TCnsDMTable;
begin
  if (Sender is TDCMMultiImage) then
  begin
    v_DCMMultiImage := (Sender as TDCMMultiImage);
    v_TT:=(v_DCMMultiImage.DicomDatasets as TCnsDMTable);
    v_TT.Currentindex := AIndex;
  end;
end;

procedure TfrmSnimki.DCMMultiImage1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FX:= c_fx_ini; FY:= c_fy_ini;
end;

procedure TfrmSnimki.DCMMultiImage1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin  //
  FX:= X; FY:= Y;
end;

procedure TfrmSnimki.DCMMultiImage1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
const c_delta = 5;
begin // запустим drag and drop вручную
  // Внимание: Никакие события мыши недоступны в режиме drag !
  If (ssLeft in Shift) and ((Abs(FX-X) > c_delta) or (Abs(FY-Y) > c_delta)) Then begin
    if (Sender is TDCMMultiImage) then begin
      MI_events_set ( False, (Sender as TDCMMultiImage) );
      (Sender as TDCMMultiImage).BeginDrag( true );
      MI_events_set ( True, (Sender as TDCMMultiImage) );
    end;
  end;
end;

// процедура формирования массива расположения
// снимков на форме
procedure frm_wnd_arr ( p_amm:Integer;              // общее количество
                        var p_res_width:Integer;
                        var p_res_height:integer );
var j,k, v_amm_cmn, v_min_delta,
    v_horiz_amm,v_vert_amm, v_tmp : Integer;
begin
  v_amm_cmn := p_amm;
  v_min_delta     := p_amm;
  v_horiz_amm := 0;
  v_vert_amm  := 0;
  // для 3 и 5 снимков по-умолчанию
  if v_amm_cmn=3 then
  begin
    v_horiz_amm := 3;
    v_vert_amm  := 1;
  end else
  if v_amm_cmn=5 then begin
    v_horiz_amm := 2;
    v_vert_amm  := 3;
  end else
  begin
    // ходим в цикле подбирая квадрат
    // с минимальным кол-вом пустых ячеек(снимков)
    for j := 1 to Trunc(sqrt(v_amm_cmn))+2 do
    begin
      // 0-для квадрата, остальное - для прямоугольника
      // рассматриваем случай когда ширина(кол-ва столбцов)
      // на 2 меньше высоты(кол-ва строк)
      for k := 0 to 2 do
      begin
        v_tmp:=j*(j-k)-v_amm_cmn;
        if ( (v_min_delta>v_tmp) and (v_tmp>=0) ) then
        begin
          // нашли очередной минимум
          v_min_delta     := v_tmp;
          // если меньше 6 то по-горизонтали
          if v_amm_cmn<6 then
          begin
            v_horiz_amm     := j;
            v_vert_amm      := j-k;
          end else
          begin // иначе - по вертикали
            v_horiz_amm     := j-k;
            v_vert_amm      := j;
          end;
          if v_tmp=0 then Break;
        end;
      end;
      if v_tmp=0 then Break;
    end;
  end;
  // что-то нашли
  p_res_width:=v_horiz_amm;
  p_res_height:=v_vert_amm;
end;

procedure p_act_window;
var v_amm, i1_fnd,j1_fnd,i,j,
    v_horiz_amm, v_vert_amm, vCurImg,
    v_width, v_Height, vRecordsCount,
    v_top, v_left, v_tmp :Integer;
    v_obj : TObject;
    v_LeftMouseInteract : TMouseInteract;
    v_modality : string;
    daPDF : TDicomAttribute;
    vImg : Boolean;
label l1, l2, l3;
const c_top = 0;
begin
  // посчитаем сколько исследований по пациенту на вкладке
  v_amm:=clc_amm_frm;
  if (v_amm>0) then
  begin
    // сформируем массив вывода снимков
    frm_wnd_arr ( v_amm, v_horiz_amm, v_vert_amm );
    // установим параметры формочек
    j:=0;
    for i := 0 to v_Snimki.Count - 1 do
      if (TWinControl(v_Snimki[i]) as TMultiForms).v_is_visible then
      begin
        i1_fnd := j div v_horiz_amm ;  // номер строки
        j1_fnd := j mod v_horiz_amm ;  // номер столбца
        Inc(j);
        // -------------------------------------------------------------------
        v_Height  := Trunc( (frmSnimki.cxPageImages.Height -
                     c_top - v_multiimages_height)/v_vert_amm);
        v_width   := Trunc( frmSnimki.cxPageImages.Width/v_horiz_amm);
        v_top     := Trunc( c_top+ v_multiimages_height+
                     v_Height*i1_fnd );
        v_left    := Trunc( v_width*j1_fnd );
        // -----------------------------------------------------------
        v_obj:=TWinControl(v_Snimki[i]);
        // -----------------------------------------------------------
        (v_obj as TMultiForms).Align  := alNone;
        // признак временно невидимый при раскрытии какого-то снимка на весь экран
        if (v_obj as TMultiForms).v_is_hide then
          (v_obj as TMultiForms).Visible:=False;
        v_tmp:=v_horiz_amm*v_vert_amm;
        if ( (v_amm<v_tmp) and
             ( i1_fnd=(v_vert_amm-2) ) and      // предпоследняя строка
             ( j1_fnd>=(v_horiz_amm-(v_tmp-v_amm)) ) and // позиции у которых надо высоту увеличить на 2
             (v_vert_amm>1)                                 // больше 1 строки
           )
        then
        begin
          v_Height  := v_Height * 2;
        end;
        if (v_obj as TMultiForms).v_is_full_screen then
        begin
          (v_obj as TMultiForms).Align  := alClient;
        end else
        begin
          v_LeftMouseInteract := (v_obj as TMultiForms).DicomMV.ActiveView.LeftMouseInteract;
          (v_obj as TMultiForms).v_width  := v_width;
          (v_obj as TMultiForms).v_Height := v_Height;
          (v_obj as TMultiForms).v_top    := v_top;
          (v_obj as TMultiForms).v_left   := v_left;
          // -----------------------------------------------------------
          (v_obj as TMultiForms).width  := v_width;
          (v_obj as TMultiForms).Height := v_Height;
          (v_obj as TMultiForms).top    := v_top;
          (v_obj as TMultiForms).left   := v_left;
          if (v_obj as TMultiForms).DicomMV.ActiveView.LeftMouseInteract<>v_LeftMouseInteract then
            (v_obj as TMultiForms).DicomMV.ActiveView.LeftMouseInteract:=v_LeftMouseInteract;
        end;
        //
        if (v_obj as TMultiForms).CnsDMTable1<>nil then
          if assigned((v_obj as TMultiForms).CnsDMTable1) then
            if (v_obj as TMultiForms).CnsDMTable1.Count=0 then
            begin
              MessageDlg('Список исследований пуст ...', mtWarning, [mbOK], 0);
            //  frmSnimki.ModalResult := mrCancel;
              v_is_Exit:=True;
              Exit;
            end;             
        
       // (v_obj as TMultiForms).CnsDMTable1[0].SaveToFile('d:\1.dcm',True, ImplicitVRLittleEndian, 100 );

        v_modality := (v_obj as TMultiForms).PreviewBeforeCmn ;
        (v_obj as TMultiForms).v_SnimokModality := v_modality;
        try
          vCurImg:=0;
          l3: vImg:=True;                
          if ( Assigned((v_obj as TMultiForms).CnsDMTable1[vCurImg].Attributes.Item[ $42,$12 ]) and
              ( (v_obj as TMultiForms).CnsDMTable1[vCurImg].Attributes.GetString( $42, $12 )='application/pdf') and
              Assigned((v_obj as TMultiForms).CnsDMTable1[vCurImg].Attributes.Item[ $42,$11 ]) )
          then begin // v_modality='OT' then   // модальность прочие -  для PDF
            frmSnimki.vPdfFiles.Append( (v_obj as TMultiForms).PreviewPDF );
            vImg:=False;
          end else if ((v_modality='SR') and (
            Assigned( (v_obj as TMultiForms).CnsDMTable1[vCurImg].Attributes.Item[ $8, $1199 ] ) or
            Assigned( (v_obj as TMultiForms).CnsDMTable1[vCurImg].Attributes.Item[ $40, $A073 ] ) or
            Assigned( (v_obj as TMultiForms).CnsDMTable1[vCurImg].Attributes.Item[ $40,$A043 ]) or
            Assigned( (v_obj as TMultiForms).CnsDMTable1[vCurImg].Attributes.Item[ $40,$A730 ])
          ))  then begin
            frmSnimki.vPdfFiles.Append( (v_obj as TMultiForms).PreviewSR );
            vImg:=False;
          end else if ((v_modality='ECG') and ((v_obj as TMultiForms).CnsDMTable1[vCurImg].Attributes.fWaveformData<>nil)) then
          begin
            (v_obj as TMultiForms).PreviewECG;
            vImg:=False;
          end else if (v_obj as TMultiForms).CnsDMTable1[vCurImg].Attributes.ImageData<>nil then
          begin
            (v_obj as TMultiForms).DicomMV.SetCurrentImage(vCurImg);
            (v_obj as TMultiForms).PreviewCmn;
            vImg:=True;
          end else
          begin    // то что не отображается 
            vRecordsCount := (v_obj as TMultiForms).CnsDMTable1.Count ;
            If ((vRecordsCount>1) and (vCurImg<vRecordsCount-1)) then
            begin
              Inc(vCurImg);
            //  (v_obj as TMultiForms).CnsDMTable1.Delete(0);
              goto l3;
            end;
          end;
        except
          MessageDlg('Ошибка отображения данных', mtError, [mbOK], 0);
//          Exit;
        end;
        // признак временно невидимый при раскрытии какого-то снимка на весь экран
        if not (v_obj as TMultiForms).v_is_hide then
          (v_obj as TMultiForms).Visible:=True;
        if vImg then
          (v_obj as TMultiForms).WMNCPaint(False);
        (v_obj as TMultiForms).dxBarManager1Bar2.DockedLeft:=(v_obj as TMultiForms).Width-15;
//        if v_modality<>'ECG' then
//          (v_obj as TMultiForms).DicomMV.Align:=alClient;
//        (v_obj as TMultiForms).DicomMV.;
        // -------------------------------------------------------------------
        (v_obj as TMultiForms).Show_Video_Panel; // установим видимость панели видео
        // процедура прорисовки ключиков у ключевых снимков в датасете в DicomMultiViewer
        MultiSetKIN( (v_obj as TMultiForms).DicomMV );
        {
        for k := 0 to (v_obj as TMultiForms).DicomMV.DicomDatasets.Count - 1 do
        begin
          if (v_obj as TMultiForms).DicomMV.DicomDatasets.Item[k].Attributes.getInteger($2809, $001D)=1 then
            (v_obj as TMultiForms).DicomMV.DicomDatasets.Item[k].Attributes.MultiSelected2:=True;
        end;
        }
        // -------------------------------------------------------------------
      end;
  end;
end;

procedure TfrmSnimki.DoShowForm_P_PID(p_pid:TStringList;
                                      p_sel_rec: array of t_p_pid_list_rec;
                                      p_amm:integer;
                                      p_MDFolderFullList:TdxMemData = nil;
                                      p_trRead: TpFIBTransaction = nil;
                                      p_DB: TpFIBDatabase = nil;
                                      p_sIP : string = '';
                                      p_sPort : string = '';
                                      p_sCalledAETitle : string = '';
                                      p_sCallingAETitle : string = '';
                                      p_sUser : string = '';
                                      p_key : Boolean = False;
                                      p_not_use_3d : Boolean = False; // True - не отображать 3D меню и не загружать dll 3D обработки
                                      p_isPostgres : Boolean = False; // если true то работаем с Postgres
                                      p_PGconn: TUniConnection = nil;
                                      p_MnUniTransaction : TUniTransaction = nil
                                  );
var i : Integer;
    v_amm_tmp, v_len_tmp : Integer;
  procedure crt_tabsheet (const v_i:integer);
  var j:Integer;
      v_CnsDMTable1:TCnsDMTable;
      v_cxTabSheet:TMyTabSheet;
      v_Panel : TPanel;
      v_DCMMultiImage : TDCMMultiImage;
      v_ii, v_amms :Integer;
      // для загрузки
      das: TDicomAttributes;
      daPDF : TDicomAttribute;
    procedure p_Crt_Form_Study_UID ( const p_studyUID : string;
                                     const p_P_PID : string;
                                     const p_cxTabSheet : TMyTabSheet;
                                     const p_CnsDMTable1 : TCnsDMTable;
                                     const p_DCMMultiImage : TDCMMultiImage;
                                     const p_Panel : TPanel
                                   );
    var CnsDicomConnection1: TCnsDicomConnection;
        v_iii, i2 : integer;  vStudyFnd : Boolean;
        v_MyForm : TMultiForms;
        da1: TDicomDataset;
        v_CnsDMTable_tmp: TCnsDMTable;
        v_MemoryStream : TMemoryStream ;
     //   v_Stream : TMemoryStream;
     //   str1 : string;
    {  procedure ShowFrame(App: Integer; aParent: TWinControl);stdcall;
      var
        DllApp: TApplication;
      begin
        DllApp:= Application;
        Application:= TApplication(App);
        Frame1 := TFrame1.Create(Application);
        Frame1.ParentWindow := aParent.Handle;
        SetParent(Frame1.Handle, aParent.Handle);
        Application:= DllApp;
      end;  }
    var vModTmp : string;
        vAmmImages:TStringList;
        vImagesSize, vCurImgLd : Integer;
      procedure ConnectionCreate;
      begin
        CnsDicomConnection1 := TCnsDicomConnection.Create(self); // ,RLELossless
        CnsDicomConnection1.MySetTransferSyntax( RLELossless );  //  JPEGLossless
        CnsDicomConnection1.Host := v_sIP;
        CnsDicomConnection1.Port := StrToInt(v_sPort);
        CnsDicomConnection1.CalledTitle := v_sCalledAETitle;
        CnsDicomConnection1.CallingTitle := v_sCallingAETitle;
        CnsDicomConnection1.ReceiveTimeout := c_Timeout;
        CnsDicomConnection1.OnCGETProcess:=MyCnsDicomConnection1CGETProcess;
        DCM_Connection.PDUTempPath:=GetTempDirectory;
      end;
      procedure ConnectionDestroy;
      begin
        MyDisconnectAssociation(CnsDicomConnection1);
        CnsDicomConnection1.free;
        v_MyForm.DicomMV.DicomDatasets:=v_MyForm.CnsDMTable1;
        if CmnUnit.v_exit_progressbar=2 then
        begin
          v_MyForm.DicomMV.Update;
          v_MyForm.DicomMV.Repaint;
          v_DCMMultiImage.Repaint;
        end;
        if (Trim(p_sel_rec[j].INSTANCEUID)='')
        then
          vAmmImages.Free;
      end;
      procedure LoadSnimok;
      begin
        da1 := TDicomDataset.Create(TDicomAttributes(CnsDicomConnection1.ReceiveDatasets[v_iii]));
        daPDF := TDicomAttributes(CnsDicomConnection1.ReceiveDatasets[v_iii]).Item[$2006, $0001];
        vModTmp := da1.Attributes.GetString(dModality);
        if Assigned(daPDF) then
        begin
         { if vModTmp = 'MR' then
          begin
            Continue;
          end; }
          v_MemoryStream := TMemoryStream.Create ;
          try
            daPDF.SaveToStream(v_MemoryStream);
            da1.LoadFromStream(v_MemoryStream);
          finally
            v_MemoryStream.Free;
          end;
        end;
        if vModTmp<>'PR' then
          v_MyForm.CnsDMTable1.Add(da1);
        p_CnsDMTable1.Add(da1);
        LogWrt('загружен '+inttostr(v_iii+1)+' снимок');
      end;
    begin
      vStudyFnd:=False;
      for i2 := 0 to v_forms_list.Count - 1 do
        if TMultiForms( v_forms_list[i2] ).vp_StudyInstanceUID=
           p_studyUID
        then
        begin
          v_MyForm := TMultiForms( v_forms_list[i2] ) ;
          vStudyFnd:=True;
          Break;
        end;
      if not vStudyFnd then
      begin
        // создадим форму соответствующую STUDY   Application.Handle  Self
        try
          v_MyForm                  := TMultiForms.Create( Self );  // 
        except
          on E:Exception do
          begin
            ShowMessage('Error (создание формы просмотра) '+E.Message);
          end;
        end;
//        v_MyForm                  := TMultiForms.CreateParented(Self.Handle);  // HWND
        Inc(v_n_obj);
        v_MyForm.Name             := 'FRAME'+inttostr(v_n_obj);
        v_forms_list.Add(v_MyForm);
        v_Snimki.Add(v_MyForm);
        v_MyForm.DicomMV.DicomDatasets:=nil;
        v_MyForm.DicomMV.not_show_video := True;           // не показывать управление видео
        v_MyForm.Visible          := False;
        v_MyForm.v_is_visible     := True;
        v_MyForm.v_is_full_screen := False;                // признак - развернуть снимок на весь экран
        v_MyForm.v_is_hide        := False;                // признак временно невидимый при раскрытии какого-то снимка на весь экран
        v_MyForm.Parent           := MainTabSheet;
        v_MyForm.vp_CnsDMTablePID := p_CnsDMTable1;        // CnsDMTable для пациента(закладки) PID
        v_MyForm.vp_DCMMultiImage := p_DCMMultiImage;      // DCMMultiImage для пациента (закладки)
        v_MyForm.vp_Panel         := p_Panel;              // панель для DCMMultiImage
        v_MyForm.vp_P_PID         := p_P_PID;              // P_PID пациента
        v_MyForm.vp_StudyInstanceUID := p_studyUID;           // STUDYUID
        v_MyForm.vp_tabsheet      := p_cxTabSheet;         // TabSheet
        v_MyForm.v_is_negative    := False;                // признак негатива снимка
        v_multiview_list.Add(p_DCMMultiImage);
      end;
      // -----------------------------------------------------------------------
      if frmSnimki.v_pr_data_fr=0 then // архив
      begin
        // получим кол-во снимков
        if (Trim(p_sel_rec[j].INSTANCEUID)='')
        then
        begin
          vAmmImages := getListImages  ( StrToInt(v_sPort), // pPort : integer;
                                        v_sIP, // pHost,
                                        v_sCalledAETitle,
                                        v_sCallingAETitle,
                                        p_sel_rec[j].STUDYUID,
                                        p_sel_rec[j].ACCESSIONNUMBER,
                                        vImagesSize
                                      );
        end
        else
        begin
          vAmmImages:=TStringList.Create;    // все зачитываем за один запрос
          vAmmImages.Append(Trim(p_sel_rec[j].INSTANCEUID));
          vImagesSize:=1;
        end;
        // ---------------------------------------------------------------------
        try
          LogWrt( 'запрос C_GET в архив'+#13+
                  'STUDYUID='+p_sel_rec[j].STUDYUID+#13+
                  'ACCESSIONNUMBER='+p_sel_rec[j].ACCESSIONNUMBER+#13+
                  'IP='+v_sIP+#13+
                  'Port='+v_sPort+#13+
                  'CalledAETitle='+v_sCalledAETitle+#13+
                  'CallingAETitle='+v_sCallingAETitle
                );
          if vAmmImages.Count>100 then  // грузим по одному изображению
          begin
            FrmProgressBar.clc_posMain( 0, 'Выполнение запроса к серверу', False );
            CmnUnit.v_exit_progressbar:=0;
            LogWrt('-------------------   запрос CnsDicomConnection1.C_GET');
            for vCurImgLd := 0 to vAmmImages.Count - 1 do
            begin
              ConnectionCreate;
              try
                das := TDicomAttributes.Create;
                with das do
                begin
                  AddVariant(78, 'IMAGE'); //
                  AddVariant(dStudyInstanceUID, p_sel_rec[j].STUDYUID);

                //  ShowMessage('123!!! = '+vAmmImages[vCurImgLd]);

                  AddVariant(dSOPInstanceUID, vAmmImages[vCurImgLd] ); //  p_sel_rec[j].INSTANCEUID    // Add(63, $0008, $0018, tUI, 'SOPInstanceUID', '1');
                  if p_key then AddVariant($2809, $001D, 1);
                  if CnsDicomConnection1.C_GET(das) then // получаем снимки
                  begin
                    FrmProgressBar.clc_posMain( vAmmImages.Count,
                                            'Загрузка снимков',
                                            False // (p_pid.Count=1)
                                            );
                    LogWrt('получено '+inttostr(CnsDicomConnection1.ReceiveDatasets.Count)+' снимков');

                    for v_iii := 0 to CnsDicomConnection1.ReceiveDatasets.Count - 1 do // отображаем снимки
                    begin

                      FrmProgressBar.MyIncPos('Загрузка снимков ' +
                        inttostr(Trunc(v_iii*(vAmmImages.Count+1)))+'/'+inttostr(CnsDicomConnection1.ReceiveDatasets.Count));
                      if CmnUnit.v_exit_progressbar=0 then
                      begin
                        LoadSnimok;
                      end else
                        break;
                    end;
                    LogWrt('загрузка снимков завершена. Загружено '+inttostr(v_iii+1)+' снимков.');
                    CnsDicomConnection1.ReceiveDatasets.Clear;
                  end;
                end;
              finally
                ConnectionDestroy;
              end;
            end;
            CmnUnit.v_exit_progressbar:=2;
          end else
          begin
            ConnectionCreate;

            try
              das := TDicomAttributes.Create;
              with das do
              begin
                if (Trim(p_sel_rec[j].INSTANCEUID)<>'') then
                begin
                  AddVariant(78, 'IMAGE');
                  AddVariant(dStudyInstanceUID, p_sel_rec[j].STUDYUID);
                  AddVariant(dSOPInstanceUID, p_sel_rec[j].INSTANCEUID);
                end else
                begin
                  AddVariant(78, 'STUDY');
                  if ((p_sel_rec[j].ACCESSIONNUMBER = '') or (p_sel_rec[j].ACCESSIONNUMBER = '0')) then
                  begin
                    AddVariant(dStudyInstanceUID, p_sel_rec[j].STUDYUID);
                  end else
                  begin
                    AddVariant(dAccessionNumber, p_sel_rec[j].ACCESSIONNUMBER);
                  end;
                end;
                if p_key then AddVariant($2809, $001D, 1);
                FrmProgressBar.clc_posMain( 0, 'Выполнение запроса к серверу',
                                          False {(p_pid.Count=1)} );
                CmnUnit.v_exit_progressbar:=0;

                LogWrt('-------------------   запрос CnsDicomConnection1.C_GET');

                if CnsDicomConnection1.C_GET(das) then // получаем снимки
                begin
                  FrmProgressBar.clc_posMain( CnsDicomConnection1.ReceiveDatasets.Count,
                                          'Загрузка снимков',
                                          False // (p_pid.Count=1)
                                          );
                  LogWrt('получено '+inttostr(CnsDicomConnection1.ReceiveDatasets.Count)+' снимков');

                  for v_iii := 0 to CnsDicomConnection1.ReceiveDatasets.Count - 1 do // отображаем снимки
                  begin

                    FrmProgressBar.MyIncPos('Загрузка снимков ' +
                      inttostr(v_iii+1)+'/'+inttostr(CnsDicomConnection1.ReceiveDatasets.Count));
                    if CmnUnit.v_exit_progressbar=0 then
                    begin
                      LoadSnimok;
                    end else
                      break;
                  end;
                  LogWrt('загрузка снимков завершена. Загружено '+inttostr(v_iii+1)+' снимков.');
                  CnsDicomConnection1.ReceiveDatasets.Clear;
                end;
                CmnUnit.v_exit_progressbar:=2;
              end;
            finally
              ConnectionDestroy;
            end;
          end;
          // ---------------------------------------------------------------------
        finally
          vAmmImages.Free;
        end;

      end else if frmSnimki.v_pr_data_fr=1 then  // из папки
      begin
        // читаем из папки
        FrmProgressBar.clc_posMain( 0, 'Чтение списка файлов',
                                  False );
        CmnUnit.v_exit_progressbar:=0;
        try
          with p_MDFolderFullList do  //  frmMain.MDFolderFullList
          begin
            v_amms := 0;
            First;
            while not Eof do
            begin  // определим количество для ползунка
              if (p_sel_rec[j].STUDYUID=FieldByName('STUDYUID').AsString)
              then
                Inc(v_amms);
              Next;
            end;
            v_iii:=0;
            FrmProgressBar.clc_posMain( v_amms, 'Загрузка снимков', False );
            First;
            while not Eof do
            begin
              if (p_sel_rec[j].STUDYUID  = FieldByName('STUDYUID').AsString)
              and (p_sel_rec[j].MODALITY = FieldByName('STUDIES_IMAGE_TYPE').AsString)
              then
              begin
                Inc(v_iii);
                FrmProgressBar.MyIncPos('Загрузка снимков ' +
                  inttostr(v_iii)+'/'+inttostr(v_amms));
                if CmnUnit.v_exit_progressbar=0 then
                begin
                  v_CnsDMTable_tmp := TCnsDMTable.Create(nil);
                  try
                    LogWrt( 'чтение из файла '+FieldByName('FILENAME').AsString );
                    v_CnsDMTable_tmp.LoadFromFile(FieldByName('FILENAME').AsString);
                    da1:=v_CnsDMTable_tmp[0];
                    if da1.Attributes.GetString(dModality)<>'PR' then
                    if p_key then // ключевые снимки
                    begin
                      if da1.Attributes.getInteger($2809, $001D)=1 then
                      begin
                        v_MyForm.CnsDMTable1.Add(da1);
                        p_CnsDMTable1.Add(da1);
                      end;
                    end else
                    begin
                      v_MyForm.CnsDMTable1.Add(da1);
                      p_CnsDMTable1.Add(da1);
                    end;
                  finally
                    v_CnsDMTable_tmp.Free;
                  end;
                end
                else break;
              end;
              Next;
            end;
          end;
          CmnUnit.v_exit_progressbar:=2;
        finally
          v_MyForm.DicomMV.DicomDatasets:=v_MyForm.CnsDMTable1;
          if CmnUnit.v_exit_progressbar=2 then
          begin
            v_MyForm.DicomMV.Update;
            v_MyForm.DicomMV.Repaint;
            v_DCMMultiImage.Repaint;
          end;
        end;
      end else if frmSnimki.v_pr_data_fr=2  then  // удаленная база
      begin
        v_is_moveDCM:=True;
        v_LCnsDMTable1:= v_MyForm.CnsDMTable1;
        v_LCnsDMTable2:= p_CnsDMTable1;
        try
          v_MyForm.DicomMV.DicomDatasets:=nil;
          LogWrt( 'удаленная база'+#13+
                  'STUDYUID='+p_sel_rec[j].STUDYUID+#13+
                  'IP='+v_sIP+#13+
                  'Port='+v_sPort+#13+
                  'CalledAETitle='+v_sCalledAETitle+#13+
                  'CallingAETitle='+v_sCallingAETitle
                );

{ShowMessage('удаленная база'+#13+
            'STUDYUID='+p_sel_rec[j].STUDYUID+#13+
            'IP='+v_sIP+#13+
            'Port='+v_sPort+#13+
            'CalledAETitle='+v_sCalledAETitle+#13+
            'CallingAETitle='+v_sCallingAETitle);   }

          if v_is_start_dicom_server then
              if not v_started then              
              try
                DicomServerCore1.Start;
                v_started:=True;
              except
                on E:Exception do
                  ShowMessage(DateTimeToStr(Now)+' ERROR DicomServer Start (listen port '+inttostr(DicomServerCore1.ServerPort)+') : '+E.Message );
              end;
          gt_list_for_studyUIDs ( p_sel_rec[j].STUDYUID, // const p_studyUID : String;
                                v_sIP, //  const p_host:string;
                                StrToInt(v_sPort), //   const p_port:Integer;
                                0, //  const p_local_port:Integer;
                                v_sCalledAETitle, //  const p_CalledAET:string;
                                v_sCallingAETitle, //  const p_CallingAET:string;
                                FrmProgressBar, //  const p_progressbar_form : TFrmProgressBar;
                                (v_len_tmp=1),
                                p_sel_rec[j].P_PID, // p_PatientID : String = '',
                                '', // p_SeriesInstanceUID : String = '',
                                p_key,
                                False,  // debug
                                p_sel_rec[j].ACCESSIONNUMBER
                                );
          CmnUnit.v_exit_progressbar:=2;
        finally
          v_MyForm.DicomMV.DicomDatasets:=v_MyForm.CnsDMTable1;
          if CmnUnit.v_exit_progressbar=2 then
          begin
            v_MyForm.DicomMV.Update;
            v_MyForm.DicomMV.Repaint;
            v_DCMMultiImage.Repaint;
          end;
        end;
      end;
    end;
  var v_fn : Boolean; i11 : Integer; 
  begin
    // добавим закладку
    v_ii:=0;
    Panel1.Height:=99;
    cxPageControl1.Align:=alClient;
    //
    if cxPageControl1.PageCount<=0 then
    begin
      v_cxTabSheet := TMyTabSheet.Create(Self);
      v_cxTabSheet.PageControl := cxPageControl1;
      v_cxTabSheet.OnShow := cxtbshtPac1Show;
      v_CnsDMTable1 := TCnsDMTable.Create(nil);
      v_objList.Add(v_CnsDMTable1); // очищаем руками ...
      v_cns_tables.Add(v_CnsDMTable1);
      v_cxTabSheet.vmn_tabsheet_table:=v_CnsDMTable1;   // ссылка на table
      //
      if p_pid.Count=1 then
        v_cxTabSheet.PageControl.HideTabs:=True;
      // установим  максимальное кол-во для ползунка
      // если пациент 1 - не выводим
    {  FrmProgressBar.clc_posMain( Length(p_sel_rec),
                                    'Загрузка пациента ',
                                    False // (p_pid.Count=1)
                                   ); }
      // определим кол-во исследований
      v_amm_tmp:=0;
      for j := 0 to Length(p_sel_rec) - 1 do begin
        if p_sel_rec[j].P_PID=p_pid[i] then Inc(v_amm_tmp);
      end;
      // -------------------------------------------------------------------------
      // создадим прокрутку вверху
      // TPanel
      v_Panel := TPanel.Create(Self);
      v_Panel.Parent:=v_cxTabSheet;
      v_Panel.Caption:='';
      v_Panel.Align:=alClient;
      v_cxTabSheet.vmn_Panel:=v_Panel;       // ссылка на панель
      // DCMMultiImage - в panel  вверху
      v_DCMMultiImage := TDCMMultiImage.Create(Self);
      v_DCMMultiImage.Parent:=v_Panel;  // поместим в панель
      v_DCMMultiImage.Align:=alClient;
      v_DCMMultiImage.Color:=clBlack;
      v_DCMMultiImage.GridVisible:=True;
      v_DCMMultiImage.ParentColor:=False;
      v_DCMMultiImage.ParentShowHint:=False;
      v_DCMMultiImage.ShowHint:=True;
      v_DCMMultiImage.ShowSeriesDescription:=True;

      v_DCMMultiImage.ViewGridMode := vgmSeriesGrid;
      v_DCMMultiImage.AutoChangeSeriesMode := False;

      v_DCMMultiImage.AutoChangeSeriesMode:=False;
      v_DCMMultiImage.AutoGrid:=True;

      v_DCMMultiImage.DragMode:=dmManual;

      v_cxTabSheet.vmn_DCMMultiImage:=v_DCMMultiImage;  // ссылка на MultiImage

      MI_events_set ( True, v_DCMMultiImage );

      v_multiimages_height:=0;

    end;
    // -------------------------------------------------------------------------

//ShowMessage('1');

    // цикл по исследованиям
    for j := 0 to Length(p_sel_rec) - 1 do begin
      if p_sel_rec[j].P_PID=p_pid[v_i] then begin
        // прогрессбар нарастили
        Inc(v_ii);
        FrmProgressBar.MyIncPosMain('Загрузка пациента ' +p_sel_rec[j].P_ENAME+
           ' исследования '+inttostr(v_ii)+'/'+inttostr(v_amm_tmp));
        // запишем ФИО пациента в шапке закладки
        if v_cxTabSheet.Caption='' then
          v_cxTabSheet.Caption := p_sel_rec[j].P_ENAME;
        //
        if p_sel_rec[j].STUDYUID='' then
          p_Crt_Form_Study_UID( p_sel_rec[j].ACCESSIONNUMBER,
                                p_sel_rec[j].P_PID,
                                v_cxTabSheet,
                                v_CnsDMTable1,
                                v_DCMMultiImage,
                                v_Panel
                              )
        else                  
          p_Crt_Form_Study_UID( p_sel_rec[j].STUDYUID,
                                p_sel_rec[j].P_PID,
                                v_cxTabSheet,
                                v_CnsDMTable1,
                                v_DCMMultiImage,
                                v_Panel
                              );
        if CmnUnit.v_exit_progressbar=1 then Break;
      end;
    end;
    v_DCMMultiImage.DicomDatasets:=v_CnsDMTable1;
    v_DCMMultiImage.Visible:=True;
  end;
begin // цикл по пациентам
  if v_is_start_dicom_server then
    try
      DicomServerCore1.Start;
      v_started:=True;
    except
     // on E:Exception do
      //  ShowMessage(DateTimeToStr(Now)+' ERROR DicomServer Start (listen port '+inttostr(DicomServerCore1.ServerPort)+') : '+E.Message );
    end;
  v_isnot_show_3d := p_not_use_3d;
  if v_isnot_show_3d then
  begin
    dxBarLargeButton1.Visible:=ivNever;
    V3DRenWindow.v_is_not_load_3d_dll:=v_isnot_show_3d;
  end;
  if v_isPostgres then begin
    v_MytrRead := p_trRead;
    v_MyDB := p_DB;
  end;
  v_sIP := p_sIP;
  v_sPort := p_sPort;
  v_sCalledAETitle := p_sCalledAETitle ;
  v_sCallingAETitle := p_sCallingAETitle ;
  v_sUser := p_sUser;
  Application.CreateForm(TFrmProgressBar, FrmProgressBar);
  try
    frmSnimki.Enabled:=False;
    v_len_tmp:=Length(p_sel_rec);
    // инициализируем ползунок - чтобы что-то показать
    FrmProgressBar.clc_pos( False, // is_on_top
                            'Загрузка исследований пациента',
                            p_pid.Count,
                            (v_len_tmp=1)
                          );
    FrmProgressBar.clc_posMain( 0, // 0-не отображать ползунок
                                'Загрузка снимка',
                                (v_len_tmp=1)
                              );
   // Screen.Cursor := crHourGlass;
    // цикл по пациентам
    for I := 0 to p_pid.Count - 1 do begin
      CmnUnit.v_exit_progressbar:=0;
      crt_tabsheet(i);
      if CmnUnit.v_exit_progressbar=1 then Break;
    end;
   { if v_n_obj=0 then
    begin
      MessageDlg('Ошибка получения снимков ...', mtWarning, [mbOK], 0);
      frmSnimki.ModalResult := mrOK;
    end; }
    p_act_window;
    frmSnimki.cxPageControl1.HideTabs:=(frmSnimki.cxPageControl1.PageCount=1);
  finally
    chk_close;
    frmSnimki.Enabled:=True;
    Screen.Cursor := crDefault;
    FreeAndNil(FrmProgressBar);
  end;
  v_is_frm:=True; // признак что подготовили формы
end;

procedure TfrmSnimki.dxBarButton10Click(Sender: TObject);
var CnsDicomConnection1 : TCnsDicomConnection;
    vDirTmp : string;
    v_EmpFrm:TMultiForms;
begin  // Записать текущее исследование на CD
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    if assigned(v_EmpFrm.DicomMV.DicomDatasets) and (v_EmpFrm.DicomMV.DicomDatasets.Count > 0) then
    begin
      Application.CreateForm(TfrmCD, frmCD);
      try
        frmCD.vParentForm     := 2;
        frmCD.vDS := v_EmpFrm.DicomMV.DicomDatasets ;
    //    vDirTmp := GetTempDirectory; //  'C:\';
        vDirTmp := GetTempDirectory+'\Dicom';
        if not DirectoryExists(vDirTmp) then CreateDir(vDirTmp);
        frmCD.lDir.Caption    := vDirTmp;
        frmCD.lbDir.Directory := vDirTmp;
        frmCD.vCDDir := vDirTmp;
        frmCD.v_DataSet:=nil;
        frmCD.lKolvo.Caption := IntToStr(v_EmpFrm.DicomMV.DicomDatasets.Count);
      {  frmCD.v_DataSet.First;
        while not frmCD.v_DataSet.EOf do
        begin
          frmCD.vStudyUIDList.Append( frmCD.v_DataSet.FieldByName('STUDYUID').AsString );
          frmCD.v_DataSet.Next;
        end; }
        //
        frmCD.ShowModal;
      finally
        frmCD.Free;
      end;
    end;
  end;
end;

procedure TfrmSnimki.dxBarButton1Click(Sender: TObject);
var vDicomDataSets: TDicomDataSets;
    i, vMaxWidth, vMaxHeight : Integer;
    v_DCMAttr : TDicomAttributes;
    FileName1, AFileName, vCurDirectory,
    vTempDir, vSubDirTmp : AnsiString;
    bmp: TBitmap;
    avi1: TCnsAVIReader;
    v_DicomDataset: TDicomDataset;
    v_CurrentImage : Integer;
    vKoeff : Extended;
    v_EmpFrm:TMultiForms;
    das1: TDicomDataset;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    Screen.Cursor := crHourGlass;
    try
      vCurDirectory:=GetCurrentDir;
      v_CurrentImage:=v_EmpFrm.DicomMV.CurrentImage;
      v_DicomDataset:=v_EmpFrm.CnsDMTable1.Item[v_CurrentImage];
      //
      das1:=v_DicomDataset;
      V_ENAME := das1.Attributes.GetString(dPatientName) ;
      V_PID   := das1.Attributes.GetString(dPatientID) ;
      V_SEX   := das1.Attributes.GetString(dPatientSex) ;
      V_DATEBORN := das1.Attributes.GetString( dPatientBirthDate);
      VAccessionNumber := das1.Attributes.GetString( dAccessionNumber);
      VStartDateWorklist := das1.Attributes.GetString( dStudyDate );
      //
      mdPrintList.Open;
      vTempDir:=Trim(GetTempDirectory);
      vMaxWidth := 0; vMaxHeight := 0;
      v_DCMAttr:=v_DicomDataset.Attributes;
      FileName1:=vTempDir+'\'+inttostr(GetTickCount)+'.bmp';
      bmp := TBitmap.Create;
      try
        DCM_ImageData_Bitmap.AssignToBitmap(v_DCMAttr.ImageData, bmp,False);
        bmp.SaveToFile(FileName1);
        if vMaxWidth<bmp.Width then vMaxWidth:=bmp.Width;
        if vMaxHeight<bmp.Height then vMaxHeight:=bmp.Height;
      finally
        bmp.Free;
      end;
      //
      mdPrintList.Append;
      mdPrintList.FieldByName('npp').AsInteger:=i;
      mdPrintList.FieldByName('filename').AsString:=FileName1;
      mdPrintList.Post;
      //
      frxReport1.ShowReport;
      //
    finally
      mdPrintList.Open;
      mdPrintList.First;
      while not mdPrintList.Eof do
      begin
        if FileExists(mdPrintList.FieldByName('filename').AsString) then
          DeleteFile(mdPrintList.FieldByName('filename').AsString);
        mdPrintList.Next;
      end;
      mdPrintList.Close;
      SetCurrentDir(vCurDirectory);
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmSnimki.dxBarButton2Click(Sender: TObject);
var vDicomDataSets: TDicomDataSets;
    i, vMaxWidth, vMaxHeight : Integer;
    v_DCMAttr : TDicomAttributes;
    FileName1, AFileName, vCurDirectory,
    vTempDir, vSubDirTmp : AnsiString;
    bmp: TBitmap;
    avi1: TCnsAVIReader;
    v_DicomDataset: TDicomDataset;
    v_CurrentImage : Integer;
    vKoeff : Extended;
    v_TCnsDMTable : TCnsDMTable;
    v_EmpFrm:TMultiForms;
    das1: TDicomDataset;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    v_TCnsDMTable:=v_EmpFrm.CnsDMTable1;
    Screen.Cursor := crHourGlass;
    try
      vCurDirectory:=GetCurrentDir;
      mdPrintList.Open;
      vTempDir:=Trim(GetTempDirectory);
      //
      for I := 0 to v_TCnsDMTable.Count - 1 do
      begin
        v_DicomDataset:=v_TCnsDMTable.Item[i];
        //
        das1:=v_DicomDataset;
        V_ENAME := das1.Attributes.GetString(dPatientName) ;
        V_PID   := das1.Attributes.GetString(dPatientID) ;
        V_SEX   := das1.Attributes.GetString(dPatientSex) ;
        V_DATEBORN := das1.Attributes.GetString( dPatientBirthDate);
        VAccessionNumber := das1.Attributes.GetString( dAccessionNumber);
        VStartDateWorklist := das1.Attributes.GetString( dStudyDate );
        //
        vMaxWidth := 0; vMaxHeight := 0;
        v_DCMAttr:=v_DicomDataset.Attributes;
        FileName1:=vTempDir+'\'+inttostr(GetTickCount)+'.bmp';
        bmp := TBitmap.Create;
        try
          DCM_ImageData_Bitmap.AssignToBitmap(v_DCMAttr.ImageData, bmp,False);
          bmp.SaveToFile(FileName1);
          if vMaxWidth<bmp.Width then vMaxWidth:=bmp.Width;
          if vMaxHeight<bmp.Height then vMaxHeight:=bmp.Height;
        finally
          bmp.Free;
        end;
        //
        mdPrintList.Append;
        mdPrintList.FieldByName('npp').AsInteger:=i;
        mdPrintList.FieldByName('filename').AsString:=FileName1;
        mdPrintList.Post;
        //
      end;
      //
      frxReport1.ShowReport;
    finally
      mdPrintList.Open;
      mdPrintList.First;
      while not mdPrintList.Eof do
      begin
        if FileExists(mdPrintList.FieldByName('filename').AsString) then
          DeleteFile(mdPrintList.FieldByName('filename').AsString);
        mdPrintList.Next;
      end;
      mdPrintList.Close;
      SetCurrentDir(vCurDirectory);
      Screen.Cursor := crDefault;
    end;
    v_EmpFrm.frm_mrk;
  end;
end;

procedure TfrmSnimki.dxBarButton4Click(Sender: TObject);
begin
  kb_ini;
  if Assigned(frmCine) then
    begin
      frmCine.Show;
    end else
    begin
      Application.CreateForm(TfrmCine, frmCine);
      frmCine.Show;
    end;
end;

procedure TfrmSnimki.dxBarButton5Click(Sender: TObject);
var DV : TDicomMultiViewer;
    DAS : TDicomDatasets;
    frmSur : TSurfaceRenderForm;
    v_EmpFrm:TMultiForms;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    DV := v_EmpFrm.DicomMV;
    DAS := DV.DicomDatasets;
    if DAS.GetSeriesImageCount(DV.CurrentImage) >= 3 then
    begin
      frmSur := TSurfaceRenderForm.Create(self);
      try
        frmSur.Cns3DRenderWindow1.DicomDatasets := DAS;
        if DV.ActiveView.Attributes.ImageData.FrameCount > 3 then
          begin
            frmSur.fSeriesUID := '';
            frmSur.fDatasetIndex := DV.CurrentImage;
          end else
            frmSur.fSeriesUID := DV.ActiveView.Attributes.GetString($20, $E);
          frmSur.fModality := DV.ActiveView.Attributes.GetString(8, $60);
        if DAS.Count > 0 then
        begin
          frmSur.PrepareData;
        end;
        frmSur.ShowModal;
      finally
        frmSur.Free;
      end;
    end;
  end;
end;

procedure TfrmSnimki.dxBarButton6Click(Sender: TObject);
var DV : TDicomMultiViewer;
    DAS : TDicomDatasets;
    frmVol : TVolumeRenderingForm;
var v_EmpFrm:TMultiForms;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    DV := v_EmpFrm.DicomMV;
    DAS := DV.DicomDatasets;
    if DAS.GetSeriesImageCount(DV.CurrentImage) >= 3 then
      begin
        frmVol := TVolumeRenderingForm.Create(self);
        try
          frmVol.Cns3DRenderWindow1.DicomDatasets := DAS;
          frmVol.Cns3DRenderWindow1.RenderFunction := rf3DEndoscopyView;
          frmVol.fSeriesUID := DV.ActiveView.Attributes.GetString($20, $E);
          frmVol.fModality := DV.ActiveView.Attributes.GetString(8, $60);
          frmVol.DicomMultiViewer1.DicomDatasets := DAS;
          frmVol.DicomMultiViewer1.SeriesUID := frmVol.fSeriesUID;
          frmVol.DicomMultiViewer1.CurrentImage := DV.CurrentImage;
          if DAS.Count > 0 then
            begin
              frmVol.PrepareData;
            end;
          frmVol.ShowModal;
        finally
          frmVol.Free;
        end;
    end;
  end;
end;

procedure TfrmSnimki.dxBarButton7Click(Sender: TObject);
var DV : TDicomMultiViewer;
    DAS : TDicomDatasets;
    frmVol : TVolumeRenderingForm;
var v_EmpFrm:TMultiForms;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    DV := v_EmpFrm.DicomMV;
    DAS := DV.DicomDatasets;
    if DAS.GetSeriesImageCount(DV.CurrentImage) >= 3 then
      begin
        frmVol := TVolumeRenderingForm.Create(self);
        try
          frmVol.Cns3DRenderWindow1.DicomDatasets := DAS;
          frmVol.Cns3DRenderWindow1.RenderFunction := rf3DMaximumIntensityProjection;
          frmVol.fSeriesUID := DV.ActiveView.Attributes.GetString($20, $E);
          frmVol.fModality := DV.ActiveView.Attributes.GetString(8, $60);
          frmVol.DicomMultiViewer1.DicomDatasets := DAS;
          frmVol.DicomMultiViewer1.SeriesUID := frmVol.fSeriesUID;
          frmVol.DicomMultiViewer1.CurrentImage := DV.CurrentImage;
          if DAS.Count > 0 then
            begin
              frmVol.PrepareData;
            end;
        frmVol.ShowModal;
      finally
        frmVol.Free;
      end;
    end;
  end;
end;

procedure TfrmSnimki.dxBarButton8Click(Sender: TObject);
var DV : TDicomMultiViewer;
    DAS : TDicomDatasets;
    frmVol : TVolumeRenderingForm;
var v_EmpFrm:TMultiForms;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    DV := v_EmpFrm.DicomMV;
    DAS := DV.DicomDatasets;
    if DAS.GetSeriesImageCount(DV.CurrentImage) >= 3 then
    begin
      frmVol := TVolumeRenderingForm.Create(self);
      try
        frmVol.Cns3DRenderWindow1.DicomDatasets := DAS;
        frmVol.Cns3DRenderWindow1.RenderFunction := rf3DVolumeRendering;
        if DV.ActiveView.Attributes.ImageData.FrameCount > 3 then
          begin
            frmVol.fSeriesUID := '';
            frmVol.fDatasetIndex := DV.CurrentImage;
          end else
            frmVol.fSeriesUID := DV.ActiveView.Attributes.GetString($20, $E);
        frmVol.fModality := DV.ActiveView.Attributes.GetString(8, $60);
        frmVol.DicomMultiViewer1.DicomDatasets := DAS;
        frmVol.DicomMultiViewer1.SeriesUID := frmVol.fSeriesUID;
        frmVol.DicomMultiViewer1.CurrentImage := DV.CurrentImage;

        if DAS.Count > 0 then
          begin
            frmVol.PrepareData;
          end;
        frmVol.ShowModal;
      finally
        frmVol.Free;
      end;
    end;
  end;
end;

procedure TfrmSnimki.bbFilterIzmClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
    i: integer;
begin  // ONLY снимки с измерениями
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    if not bbFilterIzm.Down then
    begin
      v_EmpFrm.CnsDMTable2.ClearList;
      v_EmpFrm.DicomMV.DicomDatasets:=v_EmpFrm.CnsDMTable1;
      v_EmpFrm.DicomMV.CurrentImage:=0;
      v_EmpFrm.DicomMV.Refresh;
    end else
    begin
      v_EmpFrm.CnsDMTable2.ClearList;
      for I := 0 to v_EmpFrm.DicomMV.DicomDatasets.Count - 1 do
        if v_EmpFrm.DicomMV.DicomDatasets[i].Attributes.ImageData.DrawObjects.Items[0]<>nil then
          v_EmpFrm.CnsDMTable2.Add(v_EmpFrm.DicomMV.DicomDatasets[i]);
      v_EmpFrm.DicomMV.DicomDatasets:=v_EmpFrm.CnsDMTable2;
      v_EmpFrm.DicomMV.CurrentImage:=0;
      v_EmpFrm.DicomMV.Refresh;
    end;
  end;
end;

procedure TfrmSnimki.dxBarLargeButton2Click(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin  // ONLY KIN
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    v_EmpFrm.DicomMV.SetOnlyViewMultiSelected2(True);
    v_EmpFrm.DicomMV.CurrentImage:=0;
    v_EmpFrm.DicomMV.Refresh;
  end;
end;

procedure TfrmSnimki.bbXYClick(Sender: TObject);
var i:Integer;
begin  // Координаты курсора/Плотность
  kb_ini;
  for I := 0 to v_Snimki.Count - 1 do
  begin
    (TWinControl(v_Snimki[i]) as TMultiForms).DicomMV.ActiveView.ShowPixelValueHint := bbXY.Down;
    (TWinControl(v_Snimki[i]) as TMultiForms).v_is_xy := bbXY.Down;
  end;
end;

procedure TfrmSnimki.aHelpExecute(Sender: TObject);
begin // HELP
  MessageDlg('На снимке :'+#13+
             '   нажатая правая кнопка мыши '+#13+
             '       движение вверх/вниз - изменение яркости, '+#13+
             '       движение влево/вправо - изменение контраста'+#13+
             '   ALT + левая кнопка мыши + движение - '+#13+
             '       увеличить/уменьшить изображение '+#13+
             '   SCHIFT + левая кнопка мыши - лупа  '+#13+
             '   SCHIFT + правая кнопка мыши - сдвинуть снимок '
             ,
             mtInformation, [mbOK], 0);
end;

procedure TfrmSnimki.bb90LeftClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin // Повернуть на 90гр влево
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    if v_EmpFrm.CnsDMTable1.Count > 0 then
    begin
      frotalImage := (frotalImage + 1) mod 4;
      v_EmpFrm.DicomMV.rotalImage(frotalImage);
    end;
  end;
end;

procedure TfrmSnimki.bb90RightClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin // Повернуть на 90гр вправо
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    if v_EmpFrm.CnsDMTable1.Count > 0 then
    begin
      frotalImage := (frotalImage - 1 + 4) mod 4;
      v_EmpFrm.DicomMV.rotalImage(frotalImage);
    end;
  end;
end;

procedure TfrmSnimki.bbActive3dClick(Sender: TObject);
var n1 : TCns3DRenderWindow;
    wl, ww : Single;
    str1 : string;
    stm1 : TStream;
    v_EmpFrm:TMultiForms;
    DV : TDicomMultiViewer;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
    begin
      DV := v_EmpFrm.DicomMV;
      if DV.ActiveView is TCns3DRenderWindow then   
        begin
          n1 := TCns3DRenderWindow(DV.ActiveView);
          if n1.Active then
            begin
              n1.ActiveRendering := false;
            end else
            begin
              n1.ActiveRendering := true;
              n1.RenderFunction := rf3DVolumeRendering;
              n1.StartRendering;
              stm1 := LookupTableResource(16, str1);
              n1.LoadLutFromStream(stm1);
              stm1.free;
              wl := DV.ActiveView.Attributes.ImageData.WindowCenter;
              ww := DV.ActiveView.Attributes.ImageData.WindowWidth;
              n1.SetWLWW(wl, ww);
              n1.Invalidate;
            end;
        end;
    end;
end;

procedure TfrmSnimki.bbAllClick(Sender: TObject);
var i,j, v_amm : Integer;
    sFileName : string;
    sDir : string;
    v_MyTabSheet_tmp : TMyTabSheet;
    v_DCMAttr: TDicomAttributes;
    v_fio : string;
    vTransferSyntax : integer;
begin
  kb_ini;
  try
    Screen.Cursor := crHourGlass;
    FileOpenDialogDCM.DefaultFolder:=ExtractFilePath(Application.ExeName);
    FileOpenDialogDCM.Options:=[fdoPickFolders];
    if FileOpenDialogDCM.Execute then
    begin
      Application.CreateForm(TFrmProgressBar, FrmProgressBar);
      try
        CmnUnit.v_exit_progressbar:=0;
        // инициализируем ползунок - чтобы что-то показать
        FrmProgressBar.clc_pos( False, // is_on_top
                    'Сохранение исследований пациента',
                    cxPageControl1.PageCount,
                    (cxPageControl1.PageCount=1)
                  );
        FrmProgressBar.clc_posMain( 0, // 0-не отображать ползунок
                        'Сохранение снимка',
                         (cxPageControl1.PageCount=1)
                      );
        // инициализация переменных для ползунка
        MyIniMove;
        // цикл по tabsheet
        for i := 0 to cxPageControl1.PageCount - 1 do
        begin
          if CmnUnit.v_exit_progressbar=1 then Break;
          v_MyTabSheet_tmp := (cxPageControl1.Pages[i] as TMyTabSheet);
          v_amm:=v_MyTabSheet_tmp.vmn_tabsheet_table.Count;
          FrmProgressBar.MyIncPosMain(
             ' Сохранение исследований пациента '+inttostr(i+1)+'/'+inttostr(cxPageControl1.PageCount));
          // инициализация второго ползунка
          FrmProgressBar.clc_posMain( v_amm, // 0-не отображать ползунок
                            'Загрузка снимка',
                             (cxPageControl1.PageCount=1)
                          );
          for j := 0 to v_amm - 1 do
          begin
            FrmProgressBar.MyIncPos('Сохранение снимков ' +
              inttostr(j+1)+'/'+inttostr(v_amm));
            if CmnUnit.v_exit_progressbar=1 then Break;
            v_DCMAttr:=v_MyTabSheet_tmp.vmn_tabsheet_table[j].Attributes;
            sDir := FileOpenDialogDCM.FileName + '\';
            v_fio:=v_DCMAttr.GetString(dPatientName);
            p_repl_smb(v_fio);
            sFileName := v_fio+'_'+IntToStr(j+1)+'.dcm';
            vTransferSyntax := ExplicitVRLittleEndian; // 8193; // v_DCMAttr.ImageData.ImageData[0].TransferSyntax;
            v_MyTabSheet_tmp.vmn_tabsheet_table[j].SaveToFile(sDir+'\'+sFileName, True, 8193, 100);
          end;
        end;
      finally
        chk_close; // закроем ползунок
        FreeAndNil(FrmProgressBar);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmSnimki.bbAngleClick(Sender: TObject);
begin // Угол
  kb_ini;
  v_action_frm:=9;
end;

procedure TfrmSnimki.bbAreaClick(Sender: TObject);
begin  // Площадь
  kb_ini;
  v_action_frm:=6;
end;

procedure TfrmSnimki.bbArrowClick(Sender: TObject);
begin // Стрелка
  kb_ini;
  v_action_frm:=13;
end;

procedure TfrmSnimki.bbCircleClick(Sender: TObject);
begin  // Круг
  kb_ini;
  v_action_frm:=7;
end;

procedure TfrmSnimki.bbClearRClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    v_EmpFrm.DicomMV.DeleteLabel;
    //
    v_EmpFrm.frm_mrk;
  end;
end;

procedure TfrmSnimki.bbCrossClick(Sender: TObject);
begin // Пересечение
  kb_ini;
  v_action_frm:=5;
end;

procedure TfrmSnimki.bbDefaultClick(Sender: TObject);
var i:Integer;
begin // курсор
  kb_ini;
  for I := 0 to v_Snimki.Count - 1 do
  begin
    (TWinControl(v_Snimki[i]) as TMultiForms).DicomMV.ActiveView.LeftMouseInteract := miNone;
  end;
end;

procedure TfrmSnimki.bbDefClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    v_EmpFrm.DicomMV.ActiveView.ResetImage;
    // сбросим галочку инверсии
    v_EmpFrm.v_is_negative:=False;
    frmSnimki.bbInvert.Down := v_EmpFrm.v_is_negative;
  end;
end;

procedure TfrmSnimki.bbDiagClick(Sender: TObject);
begin  // Диагональ
  kb_ini;
  v_action_frm:=10;
end;

procedure TfrmSnimki.bbDragClick(Sender: TObject);
var i:Integer;
begin // Перетаскивание
  kb_ini;
  for I := 0 to v_Snimki.Count - 1 do
  begin
    (TWinControl(v_Snimki[i]) as TMultiForms).DicomMV.ActiveView.LeftMouseInteract := miScroll;
  end;
end;

procedure TfrmSnimki.bbExpClick(Sender: TObject);
const
  filterarray: array[0..8] of string = ('jpg', 'bmp', 'tif', 'Tga', 'Png', 'Pcx', 'Ppm', 'mpg', 'avi');
  QUANTCODE: array[0..7] of integer = (1, 2, 3, 4, 6, 8, 12, 16);
var
  filename1: string;
  dialog1: TSaveDialog;
  myView: TCustomDicomImage;
  bm1: TBitmap;
  v_EmpFrm:TMultiForms;
procedure SaveToMpeg(Afilename: string);
var i, k: integer;
    fs: TFileStream;
    mpg: TMpeg;
    DA: TDicomAttributes;
    bm, bm1: TBitmap;
    f1: TConvert2MpegStatusForm;
begin
  k := 32;
  f1 := TConvert2MpegStatusForm.Create(self);
  DA := v_EmpFrm.DicomMV.ActiveView.Attributes;
  mpg := TMpeg.Create;
  bm := TBitmap.Create;
  bm1 := TBitmap.Create;
  if (DA.ImageData.Width mod k) <> 0 then
    bm1.Width := (DA.ImageData.Width div k + 1) * k
  else
    bm1.Width := DA.ImageData.Width;
  if (DA.ImageData.Height mod k) <> 0 then
    bm1.Height := (DA.ImageData.Height div k + 1) * k
  else
    bm1.Height := DA.ImageData.Height;
  bm1.PixelFormat := pf24bit;
  fs := TFileStream.Create(Afilename, fmcreate);
  try
    mpg.Open(bm1.Width, bm1.Height, QUANTCODE[0], 1000 div 25, bf25hz, fs);
    f1.ProgressBar1.Max := DA.ImageData.FrameCount - 1;
    f1.Show;
    if DA.ImageData.FrameCount > 1 then
      begin
        for i := 0 to DA.ImageData.FrameCount - 1 do
          begin
            if f1.Canceled then
              break;
            DA.ImageData.CurrentFrame := i;
//            DA.ImageData.AssignToBitmap(bm);
            DCM_ImageData_Bitmap.AssignToBitmap(DA.ImageData, bm);
            bm1.Canvas.Draw((bm1.Width - bm.Width) div 2, (bm1.height - bm.height) div 2, bm);
            mpg.AddIImage(bm1);
            f1.ProgressBar1.Position := i;
          end;
      end else
      begin
  //      DA.ImageData.AssignToBitmap(bm);
        DCM_ImageData_Bitmap.AssignToBitmap(DA.ImageData, bm);
        bm1.Canvas.Draw((bm1.Width - bm.Width) div 2, (bm1.height - bm.height) div 2, bm);
        mpg.AddIImage(bm1);
      end;
  finally
    mpg.Close;
    fs.Free;
    mpg.Free;
    bm.Free;
    bm1.Free;
    f1.Free;
  end;
end;
procedure SaveToAVI(Afilename: string);
var fx1: TDicom2AVIStatusForm;
    DA: TDicomAttributes;
    i: integer;
    bm: TBitmap;
begin
  fx1 := TDicom2AVIStatusForm.Create(self);
  DA := v_EmpFrm.DicomMV.ActiveView.Attributes;
  bm := TBitmap.Create;
  DA.ImageData.CurrentFrame := 0;
//  DA.ImageData.AssignToBitmap(bm);
  DCM_ImageData_Bitmap.AssignToBitmap(DA.ImageData, bm);
  fx1.Width := bm.Width;
  fx1.Height := bm.Height;
  fx1.Filename := afilename;
  fx1.CreateAVIFile;
  fx1.ProgressBar1.Max := DA.ImageData.FrameCount - 1;
  fx1.Show;
  for i := 0 to DA.ImageData.FrameCount - 1 do
    begin
      DA.ImageData.CurrentFrame := i;
//      DA.ImageData.AssignToBitmap(bm);
      DCM_ImageData_Bitmap.AssignToBitmap(DA.ImageData, bm);
      fx1.AddAVIFrame(bm);
      fx1.ProgressBar1.Position := i;
    end;
  fx1.CloseAVIFile;
  fx1.Free;
  bm.Free;
end;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    if not assigned(v_EmpFrm.DicomMV.ActiveView.Attributes) then
      exit;
    dialog1 := TSaveDialog.Create(self);
    dialog1.Title := 'export dicom image to';
    dialog1.Filter := 'JPEG Image File (*.jpg)|*.jpg' +
                      '|Bitmaps (*.bmp)|*.bmp|TIFF Image (*.tif)|*.tif' +
                      '|Tga (*.Tga)|*.Tga|Png Image (*.Png)|*.Png' +
                      '|Pcx (*.Pcx)|*.Pcx|Ppm Image (*.Ppm)|*.Ppm' +
                      '|MPEG (*.mpg)|*.mpg|AVI (*.avi)|*.avi';
    try
      if dialog1.Execute then
      begin
        myView := v_EmpFrm.DicomMV.ActiveView;
        bm1 := TBitmap.Create;
        try
          // myView.Attributes.ImageData.AssignToBitmap(bm1, false);
          DCM_ImageData_Bitmap.AssignToBitmap(myView.Attributes.ImageData, bm1,False);

          FileName1 := Dialog1.FileName;
          if Pos('.', filename1) <= 0 then
            filename1 := filename1 + '.' + filterarray[dialog1.FilterIndex - 1];
          case dialog1.FilterIndex - 1 of
          1:
            begin
              bm1.SaveToFile(FileName1);
            end;
          0: //jpeg
            begin
              with TJpegGraphic.Create do
              try
                assign(bm1);
                SaveToFile(filename1);
              finally
                Free;
              end;
            end;
          2: //tif
            begin
              with TTiffGraphic.Create do
              try
                assign(bm1);
                SaveToFile(filename1);
              finally
                Free;
              end;
            end;
          3: //tga
            begin
              with TTgaGraphic.Create do
              try
                assign(bm1);
                SaveToFile(filename1);
              finally
                Free;
              end;
            end;
          4: //png
            begin
              with TPngGraphic.Create do
              try
                assign(bm1);
                SaveToFile(filename1);
              finally
                Free;
              end;
            end;
          5: //pcx
            begin
              with TPcxGraphic.Create do
              try
                assign(bm1);
                SaveToFile(filename1);
              finally
                Free;
              end;
            end;
          6: //ppm
            begin
              with TPpmGraphic.Create do
              try
                assign(bm1);
                SaveToFile(filename1);
              finally
                Free;
              end;
            end;
          7: //mpg
            begin
              SaveToMpeg(filename1);
            end;
          8: //avi
            begin
              SaveToAVI(filename1);
            end;
          end;
        finally
          bm1.Free;
        end;
      end;
    finally
      dialog1.Free;
    end;
    v_EmpFrm.frm_mrk;
  end;
end;

procedure TfrmSnimki.bbHorizontalClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin // Вертикальное отражение
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    if FlipHor = False then
      begin
        v_EmpFrm.DicomMV.SetHozFlip(True);
        FlipHor := True;
      end else
      begin
        v_EmpFrm.DicomMV.SetHozFlip(False);
        FlipHor := False;
      end;
  end;
end;

procedure TfrmSnimki.bbHWRectClick(Sender: TObject);
begin  // Высота и ширина прямоугольника
  kb_ini;
  v_action_frm:=12;
end;

procedure TfrmSnimki.bbImpClick(Sender: TObject);
var i: Integer;
    v_EmpFrm : TMultiForms;
  procedure add_ds_from_file ( p_filename : ansistring );
  var dds: TDicomDataset;
      str:string;
  begin
    dds := TDicomDataset.Create;
    v_EmpFrm.CnsDMTable1.ImportImageEx(dds.Attributes, p_filename, true);
    v_EmpFrm.CnsDMTable1.add(dds);
    str := ExtractFileName(p_filename);
    str := Copy(str, 1, Pos('.',str)-1);
//    dds.Attributes.AddVariant($20,$13,StrToInt(str));  // dInstanceNumber
    dds.Attributes.AddVariant($20,$13,i);  // dInstanceNumber
  end;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    if OpenDialog3.Execute then
    begin
      v_EmpFrm.CnsDMTable1.ClearList;
      for i := 0 to OpenDialog3.Files.Count - 1 do
      begin
        add_ds_from_file(OpenDialog3.Files[i]);
      end;
    end;
    v_EmpFrm.CnsDMTable1.SortDatasets(dsbImageNumber);
    v_EmpFrm.DicomMV.Update;
    v_EmpFrm.frm_mrk;
  end;
end;

procedure TfrmSnimki.bbInvertClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    v_EmpFrm.DicomMV.Negative(bbInvert.Down);
    v_EmpFrm.v_is_negative := bbInvert.Down;
  end;
end;

procedure TfrmSnimki.bbKalibrClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin
  kb_ini;
  frmSnimki.v_is_calibr := True;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    v_EmpFrm.DicomMV.ActiveView.LeaderMouserInspect := ldmiRuler;
  end;
end;

procedure TfrmSnimki.bbLineClick(Sender: TObject);
begin // отрезок
  kb_ini;
  v_action_frm:=1;
end;

procedure TfrmSnimki.bbLineHClick(Sender: TObject);
begin // Отрезок и высота
  kb_ini;
  v_action_frm:=2;
end;

procedure TfrmSnimki.bbLineHWClick(Sender: TObject);
begin  // Отрезок и ширина+высота
  kb_ini;
  v_action_frm:=4;
end;

procedure TfrmSnimki.bbLineWClick(Sender: TObject);
begin  // Отрезок и ширина
  kb_ini;
  v_action_frm:=3;
end;

procedure TfrmSnimki.bbLoadRClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    OpenDialog1.Filter := 'Presentation State File (*.pre)|*.pre';
    OpenDialog4.InitialDir := ExtractFilePath(Application.ExeName);
    if OpenDialog4.Execute then
    begin
      // проверяется на SOPInstanceUID
      v_EmpFrm.PresentationStateDS.LoadFromFile(OpenDialog4.FileName);
      v_EmpFrm.CnsDMTable1.SetPresentationSates(v_EmpFrm.PresentationStateDS);
      v_EmpFrm.DicomMV.ActiveView.Update;
    end;
    v_EmpFrm.frm_mrk;
  end;
end;

procedure TfrmSnimki.bbLupaClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin // Лупа
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    v_EmpFrm.DicomMV.ActiveView.LeftMouseInteract := miMagnifier;
  end;
end;

procedure TfrmSnimki.bbLutClick(Sender: TObject);
var stm1: TFileStream;
    v_EmpFrm:TMultiForms;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName);
    if OpenDialog1.Execute then
    begin
      stm1 := TFileStream.Create(OpenDialog1.FileName, fmOpenRead);
      v_EmpFrm.DicomMV.ActiveView.SetLut(stm1);
      stm1.Free;
    end;
  end;
end;

procedure TfrmSnimki.bbMagAreaClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin  // Увеличить область
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    v_EmpFrm.DicomMV.ActiveView.LeftMouseInteract := miSelectZoom;
  end;
end;

procedure TfrmSnimki.bbMagClick(Sender: TObject);
var i:Integer;
begin // Увеличение
  kb_ini;
  for I := 0 to v_Snimki.Count - 1 do
  begin
    (TWinControl(v_Snimki[i]) as TMultiForms).DicomMV.ActiveView.LeftMouseInteract := miZoom;
  end;
end;

procedure TfrmSnimki.bbOpenFileClick(Sender: TObject);
begin
  kb_ini;
  LdImg(False);
end;

procedure TfrmSnimki.bbOpenFolderClick(Sender: TObject);
begin
  kb_ini;
  LdImg(True);
end;

procedure TfrmSnimki.bbPlotClick(Sender: TObject);
begin // Кривая линия
  kb_ini;
  v_action_frm:=11;
end;

procedure TfrmSnimki.bbRectClick(Sender: TObject);
begin // Прямоугольник
  kb_ini;
  v_action_frm:=8;
end;

procedure TfrmSnimki.bbRulersClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin
  kb_ini;
  v_EmpFrm := gt_active_form;
  if v_EmpFrm <> nil then
  begin
    v_EmpFrm.DicomMV.ActiveView.DisplayRuler := bbRulers.Down;
  end;
end;

procedure TfrmSnimki.bbSaveKadrClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
    v_fio : string;
    vTransferSyntax : integer;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    try
      Screen.Cursor := crHourGlass;
      if assigned(v_EmpFrm.DicomMV.DicomDatasets) and (v_EmpFrm.DicomMV.DicomDatasets.Count > 0) then
      begin
        FileOpenDialogDCM.DefaultFolder:=ExtractFilePath(Application.ExeName);
        FileOpenDialogDCM.Options:=[];
        v_fio:=v_EmpFrm.DicomMV.ActiveView.Attributes.GetString(dPatientName);
        p_repl_smb(v_fio);
        FileOpenDialogDCM.FileName := v_fio + '_' + IntToStr(v_EmpFrm.DicomMV.CurrentImage+1) + '.dcm';
        if FileOpenDialogDCM.Execute then
        begin
          vTransferSyntax := v_EmpFrm.DicomMV.DicomDatasets.Item[
                    v_EmpFrm.DicomMV.ActiveView.AttributesIndex
                             ].Attributes.ImageData.ImageData[0].TransferSyntax;
          vTransferSyntax := ExplicitVRLittleEndian; // 8193 ;  //  ImplicitVRLittleEndian
          v_EmpFrm.DicomMV.DicomDatasets.Item[
                    v_EmpFrm.DicomMV.ActiveView.AttributesIndex
                             ].SaveToFile( FileOpenDialogDCM.FileName, True,
                                           vTransferSyntax,
                                           100);  //   8193    8197
          // v_DicomDataset.Attributes.ImageData.ImageData[0].TransferSyntax
          v_EmpFrm.frm_mrk;
        end;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmSnimki.bbSaveRClick(Sender: TObject);
var das: TDicomDataset;
    v_EmpFrm:TMultiForms;
    v_filename : AnsiString;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    SaveDialog1.Filter := 'Presentation State File (*.pre)|*.pre';
    SaveDialog1.InitialDir := ExtractFilePath(Application.ExeName);
    if SaveDialog1.Execute then
    begin
      v_filename:=SaveDialog1.FileName;
      if (Pos('.pre',v_filename)<=0) then
        v_filename:=v_filename+'.pre';
      das := v_EmpFrm.DicomMV.ActiveView.Attributes.ImageData.CreatePresentationState;
      das.SaveToFile(v_filename, true, ExplicitVRLittleEndian, 100);
      das.Free;
    end;
    v_EmpFrm.frm_mrk;
  end;
end;

procedure TfrmSnimki.bbSaveStudyClick(Sender: TObject);
var i : Integer;
    sFileName : string;
    sDir : string;
    v_EmpFrm:TMultiForms;
    v_fio : string;
    vTransferSyntax : integer;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    if assigned(v_EmpFrm.DicomMV.DicomDatasets) and (v_EmpFrm.DicomMV.DicomDatasets.Count > 0) then
    begin
      try
        Screen.Cursor := crHourGlass;
        if assigned(v_EmpFrm.DicomMV.DicomDatasets) and (v_EmpFrm.DicomMV.DicomDatasets.Count > 0) then
        begin
          FileOpenDialogDCM.DefaultFolder:=ExtractFilePath(Application.ExeName);
          FileOpenDialogDCM.Options:=[fdoPickFolders];
          if FileOpenDialogDCM.Execute then
          begin
            sDir := FileOpenDialogDCM.FileName + '\';
            v_fio:=v_EmpFrm.DicomMV.ActiveView.Attributes.GetString(dPatientName);
            p_repl_smb(v_fio);
            Application.CreateForm(TFrmProgressBar, FrmProgressBar);
            try
              CmnUnit.v_exit_progressbar:=0;
              // инициализируем ползунок - чтобы что-то показать
              FrmProgressBar.clc_pos( False, // is_on_top
                          'Сохранение исследования пациента',
                          v_EmpFrm.DicomMV.DicomDatasets.Count, // кол-во
                          True   // один ползунок
                        );
              FrmProgressBar.clc_posMain( v_EmpFrm.DicomMV.DicomDatasets.Count, // 0-не отображать ползунок
                            'Сохранение исследования пациента',
                             True
                          );
              // инициализация переменных для ползунка
              MyIniMove;
              for i := 0 to v_EmpFrm.DicomMV.DicomDatasets.Count - 1 do
              begin
                FrmProgressBar.MyIncPos('Сохранение снимков ' +
                  inttostr(i+1)+'/'+inttostr(v_EmpFrm.DicomMV.DicomDatasets.Count));
                if CmnUnit.v_exit_progressbar=1 then Break;
                sFileName := v_fio+'_'+IntToStr(i+1)+'.dcm';
                vTransferSyntax := ExplicitVRLittleEndian; // 8193; // v_EmpFrm.DicomMV.DicomDatasets.Item[i].Attributes.ImageData.ImageData[0].TransferSyntax;
                v_EmpFrm.DicomMV.DicomDatasets.Item[i].SaveToFile(sDir+'\'+sFileName, True, vTransferSyntax , 100); //  8193
              end;
            finally
              chk_close; // закроем ползунок
              FreeAndNil(FrmProgressBar);
            end;
          end;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
      v_EmpFrm.frm_mrk;
    end;
  end;
end;

procedure TfrmSnimki.bbSendAllClick(Sender: TObject);
var CnsDicomConnection1: TCnsDicomConnection;
    v_res : Boolean;
    v_Host : string;
    v_Port : integer;
    v_CalledAETitle, v_CallingTitle, v_TransactionUID : string;
    v_amm : integer;
    v_DCMAttr: TDicomAttributes;
    v_SOPInstanceLst : TStringList;
    v_InstanceUID_List : TStringList;
    v_MyTabSheet_tmp : TMyTabSheet;
    frmSendParam : TfrmSendParam;
  procedure snd_cmn( p_host : string;
                     p_port : Integer;
                     p_CalledAETitle : string;
                     p_CallingTitle : string;
                     p_is_local : Boolean = False
                   );
  var i, j, v_TransferSyntax : integer;
  begin
    try
      v_Host          := p_host;
      v_Port          := p_port;
      v_CalledAETitle := p_CalledAETitle;
      v_CallingTitle  := p_CallingTitle;
      Screen.Cursor := crHourGlass;
      try
        v_SOPInstanceLst := TStringList.Create;
//        CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
        v_MyTabSheet_tmp := (cxPageControl1.Pages[0] as TMyTabSheet);
        v_DCMAttr:=v_MyTabSheet_tmp.vmn_tabsheet_table[0].Attributes;
        // проверим компрессию
        // frmSendParam.ZipQuality - качество сжатия
        v_TransferSyntax:=gt_id_transfer_syntax(frmSendParam.pr_zip);
        if v_TransferSyntax=-1 then // не нашли
        begin
          CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
          CnsDicomConnection1.MySetTransferSyntax( v_DCMAttr.ImageData.ImageData[0].TransferSyntax );
        end
        else
        begin
          CnsDicomConnection1 := TCnsDicomConnection.Create(nil); //  v_TransferSyntax
          CnsDicomConnection1.MySetTransferSyntax( v_TransferSyntax, frmSendParam.ZipQuality );
        end;
        Application.CreateForm(TFrmProgressBar, FrmProgressBar);
        try
          v_TransactionUID:=GenTransactionUID(v_CallingTitle);
          CnsDicomConnection1.OnCGETProcess:=MyCnsDicomConnection1CGETProcess;
          CnsDicomConnection1.Host := v_Host;
          CnsDicomConnection1.Port := v_Port;
          CnsDicomConnection1.CalledTitle := v_CalledAETitle;
          CnsDicomConnection1.CallingTitle := v_CallingTitle;
          CnsDicomConnection1.ReceiveTimeout := c_Timeout;
          DCM_Connection.PDUTempPath:=GetTempDirectory;
          v_res:=True;
          CmnUnit.v_exit_progressbar:=0;
          // инициализируем ползунок - чтобы что-то показать
          FrmProgressBar.clc_pos( False, // is_on_top
                      'Отправка исследований пациента',
                      cxPageControl1.PageCount,
                      (cxPageControl1.PageCount=1)
                    );
          FrmProgressBar.clc_posMain( 0, // 0-не отображать ползунок
                          'Отправка снимка',
                           (cxPageControl1.PageCount=1)
                        );
          // инициализация переменных для ползунка
          MyIniMove;
          v_InstanceUID_List := TStringList.Create;
          // цикл по tabsheet
          for i := 0 to cxPageControl1.PageCount - 1 do
           begin
             if CmnUnit.v_exit_progressbar=1 then Break;
             v_MyTabSheet_tmp := (cxPageControl1.Pages[i] as TMyTabSheet);
             v_amm:=v_MyTabSheet_tmp.vmn_tabsheet_table.Count;
             FrmProgressBar.MyIncPosMain(
               ' Отправка снимков '+inttostr(i+1)+'/'+inttostr(cxPageControl1.PageCount));
             // инициализация второго ползунка
             FrmProgressBar.clc_posMain( v_amm, // 0-не отображать ползунок
                              'Загрузка снимка',
                               (cxPageControl1.PageCount=1)
                            );
             for j := 0 to v_amm - 1 do
             begin
               if CmnUnit.v_exit_progressbar=1 then Break;
               v_DCMAttr:=v_MyTabSheet_tmp.vmn_tabsheet_table[j].Attributes;
               v_DCMAttr.AddVariant($0008, $1195, v_TransactionUID);
               if v_DCMAttr.MultiSelected2 then
               begin
                 v_DCMAttr.AddVariant($2809, $001D, 1);
               end else
               begin
                 v_DCMAttr.AddVariant($2809, $001D, 0);
               end;
               FrmProgressBar.MyIncPos('Отправка снимков '+inttostr(j+1)+'/'+inttostr(v_amm));
               If CnsDicomConnection1.C_STORAGE( v_DCMAttr ) then
               begin  // 27.07.2012 FOMIN
                 v_SOPInstanceLst.Add(v_DCMAttr.GetString(dSOPInstanceUID));
               end else begin
                 v_res:=False;
               end;
             end;
           end;
        finally
          FreeAndNil(v_InstanceUID_List);
          chk_close; // закроем ползунок
          FreeAndNil(FrmProgressBar);
          MyDisconnectAssociation(CnsDicomConnection1);
          CnsDicomConnection1.Free;
        end;
        // процесс не был прерван пользователем
        if CmnUnit.v_exit_progressbar<>1 then begin
          // 27.07.2012 FOMIN  STORAGE COMMITMENT
          if v_res then begin
            if not frmSnimki.v_is_main_form then
            begin
              if (v_SOPInstanceLst.Count>0)
              then begin
                v_TransactionUID:=GenTransactionUID(v_CallingTitle);
                SC_init(v_TransactionUID);
                if v_isPostgres then
                  if DB_CMN.DB=nil then
                  begin
                    DB_CMN.trRead:=frmSnimki.v_MytrRead;
                    DB_CMN.DB:=frmSnimki.v_MyDB;
                  end;
                if MyStrToBool( DBparams_get (
                                   'DICOM', // c_DICOM,        // SECTION
                                   'ST_COMM_CONF_AFT_ST' // KEY
                                 //  frmSnimki.v_MytrRead, // FIBTransaction
                                 //  frmSnimki.v_MyDB      // TpFIBDatabase
                                  )
                               ) then
                begin
                  if f_Storage_Commitment_CMD (  v_SOPInstanceLst,
                       v_CalledAETitle, v_CallingTitle, v_Host, v_Port,
                       v_TransactionUID
                  )
                  then begin
                    Screen.Cursor := crHourGlass;
                    Storage_commitment_res_Show(v_TransactionUID);
                  end else begin
                    ShowMessage('Ошибка запроса STORAGE COMMITMENT ...');
                  end;
                end else begin
                  MessageDlg('Данные отправлены на PACS', mtInformation, [mbOK], 0);
                end;
              end;
            end else
            begin
              MessageDlg('Данные отправлены на PACS', mtInformation, [mbOK], 0);
            end;
          end else begin
            ShowMessage('Данные не отправлены ...');
          end;
        end;
      finally
        FreeAndNil(v_SOPInstanceLst);
      end;
    finally
      chk_close; // закроем ползунок
    //  frmSnimok.Enabled:=True;
      Screen.Cursor := crDefault;
    end;
  end;
begin
  kb_ini;
  if cxPageControl1.PageCount>0 then
  begin
    frmSendParam := TfrmSendParam.Create(Self);
    try
      if frmSnimki.v_is_main_form then
      begin
        if ( ( Trim(v_ip_viewer)='' ) or
             ( v_port_viewer=0 ) or
             ( Trim(v_aetitle_viewer)='' ) or
             ( Trim(v_local_ae_viewer)='' ) )
        then
        begin
          MessageDlg('Нет настроек PACS в INI-файле', mtError, [mbOK], 0);
        end
        else
        begin
          Screen.Cursor := crHourGlass;
          snd_cmn( v_ip_viewer,
                 v_port_viewer,
                 v_aetitle_viewer,
                 v_local_ae_viewer
               );
        end;
      end
      else
      begin
        with frmSendParam do
        begin
          if v_isPostgres then
          begin
            v_DB     := frmSnimki.v_MyDB;
            v_trRead := frmSnimki.v_MytrRead;
          end;
          gt_pacs_aetitle ( v_device_name,
                            v_device_comm,
                            frmSnimki.v_MytrRead,
                            frmSnimki.v_MyDB,
                            frmSnimki.v_sCalledAETitle,
                            frmSnimki.v_sUser
                          );
          EdtAETitle.Text := v_device_comm + ' ('+v_device_name+')';
          if ShowModal = mrok then
          begin
            // сохраним в реестр
            wrt_pacs_aetitle ( v_device_name, v_device_comm, frmSnimki.v_sUser );
            snd_cmn( teServer,
                     tePort,
                     v_device_name,
                     v_sCallingAETitle
                     );
          end;
        end;
      end;
    finally
      FreeAndNil(frmSendParam);
    end;
  end;
end;

procedure TfrmSnimki.bbSendKadrClick(Sender: TObject);
var CnsDicomConnection1: TCnsDicomConnection;
    v_SOPInstanceLst : TStringList;
    v_DCMAttr: TDicomAttributes;
    v_Host : string;
    v_Port, v_CurrentImage, v_TransferSyntax : integer;
    v_CalledAETitle, v_CallingTitle, v_TransactionUID : string;
    v_EmpFrm:TMultiForms;
    v_stream : TMemoryStream;
    v_DicomDataset, v_DicomDataset_tmp : TDicomDataset ;
    frmSendParam : TfrmSendParam;
  procedure snd_cmn( p_host : string;
                     p_port : Integer;
                     p_CalledAETitle : string;
                     p_CallingTitle : string
                   );
  begin
    v_CurrentImage:=v_EmpFrm.DicomMV.CurrentImage;
    v_DicomDataset:=v_EmpFrm.CnsDMTable1.Item[v_CurrentImage];
    v_DCMAttr:=v_DicomDataset.Attributes;
    // проверим компрессию
    // frmSendParam.ZipQuality - качество сжатия
    v_TransferSyntax:=gt_id_transfer_syntax(frmSendParam.pr_zip);
    if v_TransferSyntax=-1 then // не нашли
    begin
      CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
      CnsDicomConnection1.MySetTransferSyntax( v_DicomDataset.Attributes.ImageData.ImageData[0].TransferSyntax );
    end
    else
    begin
      CnsDicomConnection1 := TCnsDicomConnection.Create(nil); //  v_TransferSyntax
      CnsDicomConnection1.MySetTransferSyntax( v_TransferSyntax, frmSendParam.ZipQuality );
    end;
    DCM_Connection.PDUTempPath:=GetTempDirectory;
    try
      v_TransactionUID:=GenTransactionUID(v_CallingTitle);
      v_Host          := p_host;
      v_Port          := p_port;
      v_CalledAETitle := p_CalledAETitle;
      v_CallingTitle  := p_CallingTitle;
      // создаем соединение
      CnsDicomConnection1.Host := v_Host;
      CnsDicomConnection1.Port := v_Port;
      CnsDicomConnection1.CalledTitle := v_CalledAETitle;
      CnsDicomConnection1.CallingTitle := v_CallingTitle;
      CnsDicomConnection1.ReceiveTimeout := c_Timeout;
      // KIN
      v_DCMAttr.AddVariant($0008, $1195, v_TransactionUID);
      if v_DCMAttr.MultiSelected2 then
      begin
        v_DCMAttr.AddVariant($2809, $001D, 1);
      end else
      begin
        v_DCMAttr.AddVariant($2809, $001D, 0);
      end;
      //
      v_stream := TMemoryStream.Create;
      //
    //  v_DicomDataset_tmp := TDicomDataset.Create ;
      try
        v_DicomDataset_tmp := v_DicomDataset;

        { MessageDlg('TransferSyntax in tags ='+v_DicomDataset_tmp.Attributes.GetString(dTransferSyntaxUID)+#13+
           'TransferSyntax in image ='+inttostr(v_DicomDataset_tmp.Attributes.ImageData.GetSourceTransferSyntax)
           , mtWarning, [mbOK], 0); }
        if CnsDicomConnection1.C_STORAGE(v_DicomDataset_tmp.Attributes)
        then begin
          // проверим STORAGE COMMITMENT
          MyDisconnectAssociation(CnsDicomConnection1);
          // очистим массивы
          // (потом - вставим идентификатор запроса/транзакции
          // для множественных запросов)
          v_TransactionUID:=GenTransactionUID(v_CallingTitle);
          SC_init(v_TransactionUID);
          //
          try
            v_SOPInstanceLst := TStringList.Create;
            v_SOPInstanceLst.Add(v_DCMAttr.GetString(dSOPInstanceUID));
            if not frmSnimki.v_is_main_form then
            begin
              if v_isPostgres then
                if DB_CMN.DB=nil then
                begin
                  DB_CMN.trRead:=frmSnimki.v_MytrRead;
                  DB_CMN.DB:=frmSnimki.v_MyDB;
                end;
              if MyStrToBool( DBparams_get (
                               'DICOM', // c_DICOM,        // SECTION
                               'ST_COMM_CONF_AFT_ST' // KEY
                           //    frmSnimki.v_MytrRead, // FIBTransaction
                           //    frmSnimki.v_MyDB      // TpFIBDatabase
                              )
                           )
              then
              begin
                try
                  if f_Storage_Commitment_CMD (  v_SOPInstanceLst,
                       v_CalledAETitle, v_CallingTitle, v_Host, v_Port,
                       v_TransactionUID
                  )
                  then begin
                    Screen.Cursor := crHourGlass;
                    Storage_commitment_res_Show(v_TransactionUID);
                  end else begin
                    MessageDlg('Ошибка запроса STORAGE COMMITMENT ...', mtError, [mbOK], 0);
                  end;
                finally
                  MyDisconnectAssociation(CnsDicomConnection1);
                  CnsDicomConnection1.Free;
                end;
              end else
              begin
                MessageDlg('Данные отправлены на PACS', mtInformation, [mbOK], 0);
              end;
            end else
            begin
              MessageDlg('Данные отправлены на PACS', mtInformation, [mbOK], 0);
            end;
          finally
            FreeAndNil(v_SOPInstanceLst);
          end;
        end else
        begin
          MyDisconnectAssociation(CnsDicomConnection1);
          CnsDicomConnection1.Free;
          MessageDlg('Данные не отправлены ...', mtError, [mbOK], 0);
        end;
      finally
        //
    //    v_DicomDataset_tmp.Free;
        v_stream.Free;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm <> nil then
  begin
    if assigned(v_EmpFrm.DicomMV.DicomDatasets) and (v_EmpFrm.DicomMV.DicomDatasets.Count > 0) then
    begin
      frmSendParam := TfrmSendParam.Create(Self);
      try
        if frmSnimki.v_is_main_form then
        begin
          if ( ( Trim(v_ip_viewer)='' ) or
               ( v_port_viewer=0 ) or
               ( Trim(v_aetitle_viewer)='' ) or
               ( Trim(v_local_ae_viewer)='' ) )
          then
          begin
            MessageDlg('Нет настроек PACS в INI-файле', mtError, [mbOK], 0);
          end
          else
          begin
            Screen.Cursor := crHourGlass;
            snd_cmn( v_ip_viewer,
                     v_port_viewer,
                     v_aetitle_viewer,
                     v_local_ae_viewer
                   );
          end;
        end
        else
        begin
          with frmSendParam do
          begin
            if v_isPostgres then
            begin
              v_DB := frmSnimki.v_MyDB;
              v_trRead := frmSnimki.v_MytrRead;
            end;
            gt_pacs_aetitle(v_device_name,
                            v_device_comm,
                            frmSnimki.v_MytrRead,
                            frmSnimki.v_MyDB,
                            frmSnimki.v_sCalledAETitle,
                            frmSnimki.v_sUser);
            EdtAETitle.Text := v_device_comm + ' ('+v_device_name+')';
            if ShowModal = mrok then
            begin
              // сохраним в реестр
              wrt_pacs_aetitle (v_device_name, v_device_comm, frmSnimki.v_sUser);
              Screen.Cursor := crHourGlass;
              snd_cmn( teServer,
                     tePort,
                     v_device_name,
                     v_sCallingAETitle
                   );
            end;
          end;
        end;
      finally
        FreeAndNil(frmSendParam);
      end;
      v_EmpFrm.frm_mrk;
    end;
  end;
end;

procedure TfrmSnimki.bbSendStudyClick(Sender: TObject);
var v_amm : Integer;
    CnsDicomConnection1: TCnsDicomConnection;
    v_SOPInstanceLst : TStringList;
    v_DCMAttr: TDicomAttributes;
    v_Host : string;
    v_Port : integer;
    v_CalledAETitle, v_CallingTitle, v_TransactionUID : string;
    v_EmpFrm:TMultiForms;
    v_res : Boolean;
    frmSendParam : TfrmSendParam;
  procedure snd_cmn( p_host : string;
                     p_port : Integer;
                     p_CalledAETitle : string;
                     p_CallingTitle : string
                   );
  var i, v_TransferSyntax :integer;
  begin
    try
      v_Host          := p_host;
      v_Port          := p_port;
      v_CalledAETitle := p_CalledAETitle;
      v_CallingTitle  := p_CallingTitle;
      Screen.Cursor := crHourGlass;
      try
        v_SOPInstanceLst := TStringList.Create;
        // проверим компрессию
        // frmSendParam.ZipQuality - качество сжатия
        v_TransferSyntax:=gt_id_transfer_syntax(frmSendParam.pr_zip);
        if v_TransferSyntax=-1 then // не нашли
        begin
          CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
          CnsDicomConnection1.MySetTransferSyntax( v_EmpFrm.DicomMV.DicomDatasets.Item[0].Attributes.ImageData.ImageData[0].TransferSyntax );
        end
        else
        begin
          CnsDicomConnection1 := TCnsDicomConnection.Create(nil); //  v_TransferSyntax
          CnsDicomConnection1.MySetTransferSyntax( v_TransferSyntax, frmSendParam.ZipQuality );
        end;
        DCM_Connection.PDUTempPath:=GetTempDirectory;
        Application.CreateForm(TFrmProgressBar, FrmProgressBar);
        try
          v_TransactionUID:=GenTransactionUID(v_CallingTitle);
          CnsDicomConnection1.OnCGETProcess:=MyCnsDicomConnection1CGETProcess;
          CnsDicomConnection1.Host := v_Host;
          CnsDicomConnection1.Port := v_Port;
          CnsDicomConnection1.CalledTitle := v_CalledAETitle;
          CnsDicomConnection1.CallingTitle := v_CallingTitle;
          CnsDicomConnection1.ReceiveTimeout := c_Timeout;
          v_res:=True;
          CmnUnit.v_exit_progressbar:=0;
          v_amm := v_EmpFrm.DicomMV.DicomDatasets.Count ;
          // инициализируем ползунок - чтобы что-то показать
          FrmProgressBar.clc_pos( False, // is_on_top
                      'Отправка исследования пациента',
                      v_amm, // кол-во
                      True   // один ползунок
                    );
          FrmProgressBar.clc_posMain( v_amm, // 0-не отображать ползунок
                        'Отправка исследования пациента',
                         True
                      );
          // инициализация переменных для ползунка
          MyIniMove;
          // цикл по снимкам исследования
          for i := 0 to v_amm - 1 do
          begin
             FrmProgressBar.MyIncPos('Отправка снимков ' +
               inttostr(i+1)+'/'+inttostr(v_amm));
             if CmnUnit.v_exit_progressbar=1 then Break;
             v_DCMAttr:=v_EmpFrm.DicomMV.DicomDatasets.Item[i].Attributes;
             v_DCMAttr.AddVariant($0008, $1195, v_TransactionUID);
             if v_DCMAttr.MultiSelected2 then
             begin
               v_DCMAttr.AddVariant($2809, $001D, 1);
             end else
             begin
               v_DCMAttr.AddVariant($2809, $001D, 0);
             end;
             if CnsDicomConnection1.C_STORAGE( v_DCMAttr ) then
             begin  // 27.07.2012 FOMIN
               v_SOPInstanceLst.Add(v_DCMAttr.GetString(dSOPInstanceUID));
             end else
             begin
               v_res:=False;
             end;
          end;
        finally
          chk_close; // закроем ползунок
          FreeAndNil(FrmProgressBar);
          MyDisconnectAssociation(CnsDicomConnection1);
          CnsDicomConnection1.Free;
        end;
        // процесс не был прерван пользователем
        if CmnUnit.v_exit_progressbar<>1 then
        begin
          // 27.07.2012 FOMIN STORAGE COMMITMENT
          if v_res then begin
            if not frmSnimki.v_is_main_form then
            begin
              if (v_SOPInstanceLst.Count>0)
              then begin
                v_TransactionUID:=GenTransactionUID(v_CallingTitle);
                SC_init(v_TransactionUID);
                if v_isPostgres then
                  if DB_CMN.DB=nil then
                  begin
                    DB_CMN.trRead:=frmSnimki.v_MytrRead;
                    DB_CMN.DB:=frmSnimki.v_MyDB;
                  end;
                if MyStrToBool( DBparams_get (
                                   'DICOM', // c_DICOM,        // SECTION
                                   'ST_COMM_CONF_AFT_ST' // KEY
                                 //  frmSnimki.v_MytrRead, // FIBTransaction
                                 //  frmSnimki.v_MyDB      // TpFIBDatabase
                                  )
                               )
                then
                begin
                  if f_Storage_Commitment_CMD (  v_SOPInstanceLst,
                       v_CalledAETitle, v_CallingTitle, v_Host, v_Port,
                       v_TransactionUID
                  )
                  then begin
                    Screen.Cursor := crHourGlass;
                    Storage_commitment_res_Show(v_TransactionUID);
                  end else begin
                    ShowMessage('Ошибка запроса STORAGE COMMITMENT ...');
                  end;
                end else begin
                  MessageDlg('Данные отправлены на PACS', mtInformation, [mbOK], 0);
                end;
              end;
            end else
            begin
              MessageDlg('Данные отправлены на PACS', mtInformation, [mbOK], 0);
            end;
          end else begin
            ShowMessage('Данные не отправлены ...');
          end;
        end;
      finally
        FreeAndNil(v_SOPInstanceLst);
      end;
    finally
      chk_close; // закроем ползунок
      Screen.Cursor := crDefault;
    end;
  end;
begin // отправить исследование
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    if assigned(v_EmpFrm.DicomMV.DicomDatasets) and (v_EmpFrm.DicomMV.DicomDatasets.Count > 0) then
    begin
      frmSendParam := TfrmSendParam.Create(Self);
      try
        if frmSnimki.v_is_main_form then
        begin
          if ( ( Trim(v_ip_viewer)='' ) or
               ( v_port_viewer=0 ) or
               ( Trim(v_aetitle_viewer)='' ) or
               ( Trim(v_local_ae_viewer)='' ) )
          then
          begin
            MessageDlg('Нет настроек PACS в INI-файле', mtError, [mbOK], 0);
          end
          else
          begin
            Screen.Cursor := crHourGlass;
            snd_cmn( v_ip_viewer,
                   v_port_viewer,
                   v_aetitle_viewer,
                   v_local_ae_viewer
                 );
          end;
        end
        else
        begin
          with frmSendParam do
          begin
            if v_isPostgres then
            begin
              v_DB     := frmSnimki.v_MyDB;
              v_trRead := frmSnimki.v_MytrRead;
            end;
            gt_pacs_aetitle ( v_device_name,
                            v_device_comm,
                            frmSnimki.v_MytrRead,
                            frmSnimki.v_MyDB,
                            frmSnimki.v_sCalledAETitle,
                            frmSnimki.v_sUser
                           );
            EdtAETitle.Text := v_device_comm + ' ('+v_device_name+')';
            if ShowModal = mrok then
            begin
              // сохраним в реестр
              wrt_pacs_aetitle ( v_device_name, v_device_comm, frmSnimki.v_sUser );
              snd_cmn( teServer,
                       tePort,
                       v_device_name,
                       v_sCallingAETitle
                       );
            end;
          end;
        end;
      finally
        FreeAndNil(frmSendParam);
      end;
    end;
    v_EmpFrm.frm_mrk;
  end;
end;

procedure TfrmSnimki.bbTagsClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    v_EmpFrm.DicomMV.ActiveView.DisplayLabel := bbTags.Down;
  end;
end;

procedure TfrmSnimki.bbTextClick(Sender: TObject);
begin // Надпись
  kb_ini;
  v_action_frm:=14;
end;

procedure TfrmSnimki.bbVerticalClick(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin  // Горизонтальное отражение
  kb_ini;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    if FlipVer = False then
      begin
        v_EmpFrm.DicomMV.SetVerFlip(True);
        FlipVer := True;
      end else
      begin
        v_EmpFrm.DicomMV.SetVerFlip(False);
        FlipVer := False;
      end;
  end;
end;

procedure TfrmSnimki.ParamsViewerIni;
var v_ini : TIniFile;
    v_exe_path : AnsiString;
begin
  if frmSnimki.v_is_main_form then
  begin
    // текущий каталог
    v_exe_path:=ExtractFilePath(Application.ExeName);
    v_ini:=TIniFile.Create(v_exe_path+'DicomViever.ini');
    try
      v_aetitle_viewer   := v_ini.ReadString ( 'DICOMVIEWER', 'AETITLE', '' );
      v_ip_viewer        := v_ini.ReadString ( 'DICOMVIEWER', 'IP', '' );
      v_local_ae_viewer  := v_ini.ReadString ( 'DICOMVIEWER', 'LOCALAETITLE', '' );
      v_port_viewer      := v_ini.ReadInteger( 'DICOMVIEWER', 'PORT', 0 );
      if v_aetitle_viewer='' then  // для записи в файл строк 1 раз
      begin
        try
          v_ini.WriteString ( 'DICOMVIEWER', 'AETITLE'     , v_aetitle_viewer );
          v_ini.WriteString ( 'DICOMVIEWER', 'IP'          , v_ip_viewer );
          v_ini.WriteString ( 'DICOMVIEWER', 'LOCALAETITLE', v_local_ae_viewer );
          v_ini.WriteInteger( 'DICOMVIEWER', 'PORT'        , v_port_viewer );
        except
        end;
      end;
    finally
      FreeAndNil(v_ini);
    end;
  end;
end;

procedure TfrmSnimki.FormActivate(Sender: TObject);
begin
  if v_is_Exit then
 //   ModalResult:=mrCancel
  else
  try
    v_is_move:=False;
    cntr_frm(Self,v_is_move);
    SetFirstActive;
    if v_isnot_show_3d then
      dxBarLargeButton1.Visible:=ivNever;
    if not frmSnimki.v_is_main_form then
    begin
       v_aetitle_viewer  :='';
       v_ip_viewer       :='';
       v_local_ae_viewer :='';
       v_port_viewer     :=0;
    end;
  except

  end;
end;

procedure TfrmSnimki.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSnimki.FormCreate(Sender: TObject);
begin
  v_is_show_err_msg_ld_files := True;
  v_is_Exit:=False;
  vPdfFiles := TStringList.Create;
  vNFrgECG:=0;
  vFrgECG := TList.Create;
  v_font_ECG := TFont.Create;
  v_is_start_dicom_server:= False;
  v_started:= False;
  v_is_log:=False;
  v_is_stlViewer:=False;
  bbSendKadr.Enabled:= not v_is_stlViewer;
  bbSendStudy.Enabled:= not v_is_stlViewer;
  bbSendAll.Enabled:= not v_is_stlViewer;
  v_logfile:='';
  if v_isnot_show_3d then V3DRenWindow.v_is_not_load_3d_dll:=True;
  v_is_main_form:=False;
  DoubleBuffered:=True;
  v_objList:= TList.Create;
  v_forms_list:= TList.Create;
  v_Snimki := TList.Create;
  v_multiview_list := TList.Create;
  v_cns_tables := TList.Create;
  FX:= c_fx_ini;
  FY:= c_fy_ini;
  // по умолчанию всегда открывется первая закладка слева "Изображение"
  v_is_frm:=False;
  v_action_frm:=0;
  v_n_obj:=0;
  // загрузим из реестра настройки ЭКГ
  with TRegistry.Create do
  try
    if OpenKey('\SoftWare\SoftMaster\fSnimki\User\ECGView',False) then
    begin
      if not ValueExists('color_fon_ECG') then
        v_color_fon_ECG  := RGB( 255, 237, 196 ) // Цвет фона ЭКГ белый  clWhite
      else
        v_color_fon_ECG  := ReadInteger('color_fon_ECG' ); // цвет фона белый  clWhite         // Цвет фона ЭКГ
      if not ValueExists('color_rzd_ECG') then
        v_color_rzd_ECG  := RGB( 182, 182, 182 )         // Цвет разделителей
      else
        v_color_rzd_ECG  := ReadInteger('color_rzd_ECG' );         // Цвет разделителей
      if not ValueExists('color_rzd_grp_ECG') then
        v_color_rzd_grp_ECG  := RGB( 220, 220, 220 ) // Цвет разделителей групп
      else
        v_color_rzd_grp_ECG  := ReadInteger('color_rzd_grp_ECG' ); // Цвет разделителей групп
      if not ValueExists('size_line_rzd_ECG') then
        v_size_line_rzd_ECG  := 1   // толщина линии разделителя
      else
        v_size_line_rzd_ECG  := ReadInteger('size_line_rzd_ECG');   // толщина линии разделителя
      // толщина кривой ЭКГ
      if not ValueExists('color_text_ECG') then
        v_color_text_ECG := clBlue         // Цвет текста
      else
        v_color_text_ECG := ReadInteger('color_text_ECG');         // Цвет текста
      if not ValueExists('color_line_ECG') then
        v_color_line_ECG := clRed         // Цвет кривой ЭКГ
      else
        v_color_line_ECG := ReadInteger('color_line_ECG');         // Цвет кривой ЭКГ
      if not ValueExists('font_ECG.Name') then
        v_font_ECG.Name   := 'Tahoma'     // Шрифт
      else
        v_font_ECG.Name   := ReadString('font_ECG.Name');     // Шрифт
      if not ValueExists('size_font_ECG') then
        v_size_font_ECG   := 8       // Размер шрифта
      else
        v_size_font_ECG   := ReadInteger('size_font_ECG');       // Размер шрифта
      if not ValueExists('bold_font_ECG') then
        v_bold_font_ECG   := False   // Жирный шрифт
      else
        v_bold_font_ECG   := ReadBool('bold_font_ECG');   // Жирный шрифт
      if not ValueExists('italic_font_ECG') then
        v_italic_font_ECG := False   // Под наклоном
      else
        v_italic_font_ECG := ReadBool('italic_font_ECG');   // Под наклоном
      if not ValueExists('size_line_ECG') then
        v_size_line_ECG  := 1   // толщина кривой ЭКГ
      else
        v_size_line_ECG  := ReadInteger('size_line_ECG');   // толщина кривой ЭКГ
      if ValueExists('height_channel_ECG') then
        v_height_channel_ECG := ReadInteger('height_channel_ECG')   // высота полосы отведения на графике ЭКГ
      else
        v_height_channel_ECG := 2*3*2*c_kletka ;
      if not ValueExists('otmetka_ECG') then
        v_otmetka_ECG := clRed         // Цвет кривой ЭКГ
      else
        v_otmetka_ECG := ReadInteger('otmetka_ECG');    // отметка
    end else
      pIniEcgDrawParameters;
  finally
    Free;
  end;
end;

procedure TfrmSnimki.FormDestroy(Sender: TObject);
var i:Integer; vTmpObj : TMultiForms;
begin
  for I := 0 to vPdfFiles.Count - 1 do
    if FileExists(vPdfFiles[i]) then DeleteFile(vPdfFiles[i]);
  vPdfFiles.Free;
  // сохраним в реестр настройки ЭКГ
  with TRegistry.Create do
  try
    OpenKey('\SoftWare\SoftMaster\fSnimki\User\ECGView',True);
    WriteInteger('color_fon_ECG', v_color_fon_ECG ); // цвет фона белый  clWhite         // Цвет фона ЭКГ
    WriteInteger('color_rzd_ECG', v_color_rzd_ECG ); // Цвет разделителей
    WriteInteger('color_rzd_grp_ECG', v_color_rzd_grp_ECG ); // Цвет разделителей групп
    WriteInteger('size_line_rzd_ECG', v_size_line_rzd_ECG ); // толщина линии разделителя
    // толщина кривой ЭКГ
    WriteInteger('color_text_ECG', v_color_text_ECG ); // Цвет текста
    WriteInteger('color_line_ECG', v_color_line_ECG ); // Цвет кривой ЭКГ
    WriteString('font_ECG.Name', v_font_ECG.Name );  // Шрифт
    WriteInteger('size_font_ECG', v_size_font_ECG ); // Размер шрифта
    WriteBool('bold_font_ECG', v_bold_font_ECG ); // Жирный шрифт
    WriteBool('italic_font_ECG', v_italic_font_ECG ); // Под наклоном
    WriteInteger('size_line_ECG', v_size_line_ECG ); // толщина кривой ЭКГ
    WriteInteger('height_channel_ECG', v_height_channel_ECG ); // высота полосы отведения на графике ЭКГ
    WriteInteger('otmetka_ECG', v_otmetka_ECG);    // отметка
  finally
    Free;
  end;

  // очистка объектов
  v_font_ECG.Free;
  if v_is_start_dicom_server then
    DicomServerCore1.Stop;
  for I := 0 to fSnimki.v_forms_list.Count - 1 do
  begin
      vTmpObj:=(TWinControl(fSnimki.v_forms_list[i]) as TMultiForms);
      if Assigned( vTmpObj.CnsDMTable1 ) then
        vTmpObj.CnsDMTable1.Clear;
      if Assigned( vTmpObj.PresentationStateDS ) then
        vTmpObj.PresentationStateDS.Clear;
    if vTmpObj.v_pdf_filename<>'' then
      If FileExists( vTmpObj.v_pdf_filename ) then
        DeleteFile( vTmpObj.v_pdf_filename );
  end;
  for I := 0 to v_objList.Count - 1 do
    if (Assigned(v_objList[i]) and (v_objList[i]<>nil))
    then Dispose(v_objList[i]);
  v_objList.Clear;
  v_objList.Free;
  v_forms_list.Clear;
  v_forms_list.Free;
  v_cns_tables.Clear;
  v_cns_tables.Free;
  v_multiview_list.Clear;
  v_multiview_list.Free;
  v_Snimki.Clear;
  v_Snimki.Free;
  for I := 0 to vFrgECG.Count - 1 do    // очистим фрагменты ЭКГ
    TFrmEcgFrag(vFrgECG[i]).Free;
  vFrgECG.Clear;
  vFrgECG.Free;
end;

procedure TfrmSnimki.frxReport1GetValue(const VarName: string;
  var Value: Variant);
begin
  if VarName='teP_ENAME' then begin
    Value := V_ENAME;
  end else if VarName='teP_PID' then begin
    Value := V_PID;
  end else if VarName='teP_SEX' then begin
    Value := V_SEX;
  end else if VarName='dtP_DATEBORN' then begin
    Value := V_DATEBORN;
  end else if VarName='teAccessionNumber' then begin
    Value := VAccessionNumber;
  end else if VarName='deStartDateWorklist' then begin
    Value := VStartDateWorklist;
  end else
    Value:='';
end;

procedure TfrmSnimki.kb_ini;
var v_EmpFrm:TMultiForms;
begin
  v_is_calibr := False;
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    v_EmpFrm.DicomMV.ActiveView.LeaderMouserInspect := ldmiNone;
  end;
end;

// обработка клавиши del
procedure TfrmSnimki.Keyboard_DelExecute(Sender: TObject);
var v_EmpFrm:TMultiForms;
begin
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    if assigned(v_EmpFrm.DicomMV.ActiveView.Attributes) then
    begin
      v_EmpFrm.DicomMV.ActiveView.Attributes.ImageData.DrawObjects.RemoveSelectedDrawObject;
      v_EmpFrm.DicomMV.ActiveView.Invalidate;
    end;
  end;
end;

Procedure TfrmSnimki.WMMove(Var Message : TWMMove);
var v_h, v_w, i : Integer;
    v_DCMMultiImage : TDCMMultiImage;
begin
  v_h:=Self.Height;
  v_w:=Self.Width;
  cntr_frm(Self,v_is_move);
  // проход по снимкам и перерисуем вверху снимки
  if v_is_frm then
    for I := 0 to v_multiview_list.Count - 1 do
    begin
      v_DCMMultiImage := (TWinControl(v_multiview_list[i]) as TDCMMultiImage);
     v_DCMMultiImage.Align := alNone;
     v_DCMMultiImage.Align := alClient;
    end;
  if ( (Self.Height<>v_h) or (Self.Width<>v_w) ) and v_is_frm then
    p_act_window;
end;

procedure TfrmSnimki.p_action_frm;
var v_EmpFrm:TMultiForms;
begin
  v_EmpFrm:=gt_active_form;
  if v_EmpFrm<>nil then
  begin
    case v_action_frm of
    // измерения
    1: begin // отрезок
         v_EmpFrm.DicomMV.ActiveView.LeaderMouserInspect := ldmiRuler;
       end;
    2: begin  // Отрезок и высота
         v_EmpFrm.DicomMV.ActiveView.LeaderMouserInspect := ldmiRulerVer;
       end;
    3: begin   // Отрезок и ширина
         v_EmpFrm.DicomMV.ActiveView.LeaderMouserInspect := ldmiRulerHiz;
       end;
    4: begin   // Отрезок и ширина+высота
         v_EmpFrm.DicomMV.ActiveView.LeaderMouserInspect := ldmiRulerVerHiz;
       end;
    5: begin  // Пересечение
         v_EmpFrm.DicomMV.ActiveView.LeaderMouserInspect := ldmiCross;
       end;
    // Площадь
    6: begin
         v_EmpFrm.DicomMV.ActiveView.LeaderMouserInspect := ldmiPolyonA;
       end;
    // Круг
    7: begin
         v_EmpFrm.DicomMV.ActiveView.LeaderMouserInspect := ldmiROI_Cycle;
       end;
    // Прямоугольник
    8: begin
         v_EmpFrm.DicomMV.ActiveView.LeaderMouserInspect := ldmiROI_Rect;
       end;
    // Угол
    9: begin
         v_EmpFrm.DicomMV.ActiveView.LeaderMouserInspect := ldmiAngle;
       end;
    // Диагональ
    10: begin
          v_EmpFrm.DicomMV.ActiveView.LeaderMouserInspect := ldmiReferenceLine;
        end;
    // Кривая линия
    11: begin
          v_EmpFrm.DicomMV.ActiveView.LeaderMouserInspect := ldmiPoly;
        end;
    // Высота и ширина прямоугольника
    12: begin
          v_EmpFrm.DicomMV.ActiveView.LeaderMouserInspect := ldmiSelectRect;
        end;
    // Стрелка
    13: begin
          v_EmpFrm.DicomMV.ActiveView.LeaderMouserInspect := ldmiArrow;
        end;
    // Надпись
    14: begin
          v_EmpFrm.DicomMV.ActiveView.LeaderMouserInspect := ldmiText;
        end;
    end;
    v_action_frm:=0;
  end;
end;

end.
