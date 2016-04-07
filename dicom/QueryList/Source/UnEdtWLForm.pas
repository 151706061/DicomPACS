unit UnEdtWLForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, Medotrade, dxSkinOffice2007Black, dxSkinOffice2007Green,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLookAndFeelPainters, cxGroupBox, cxGraphics,
  Menus, StdCtrls, cxButtons, DCM_Attributes, DateUtils, DICOM_CMN,
  DCM_Client, DCM_Connection, DCM_UID, DCM_Dict, CmnUnit, dxSkinBlack;

type
  TEdtWLForm = class(TForm)
    cxlbl1: TcxLabel;
    cxLabel1: TcxLabel;
    teP_ENAME: TcxTextEdit;
    teP_PID: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    dtP_DATEBORN: TcxDateEdit;
    gbReservBD: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    deEndDateWorklist: TcxDateEdit;
    cxLabel18: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxLabel25: TcxLabel;
    cxLabel26: TcxLabel;
    cxLabel28: TcxLabel;
    teSTUDYUID: TcxTextEdit;
    teAccessionNumber: TcxTextEdit;
    tePhysiciansName: TcxTextEdit;
    teStationName: TcxTextEdit;
    teStepStartTime: TcxTextEdit;
    teStepFinishTime: TcxTextEdit;
    teStationAETitle: TcxTextEdit;
    deStartDateWorklist: TcxDateEdit;
    cxLabel29: TcxLabel;
    cxLabel30: TcxLabel;
    cxLabel31: TcxLabel;
    cxLabel32: TcxLabel;
    cxLabel33: TcxLabel;
    cxLabel34: TcxLabel;
    teProcPriority: TcxTextEdit;
    teStepDescription: TcxTextEdit;
    teProcDescription: TcxTextEdit;
    teP_SEX: TcxComboBox;
    cxGroupBox1: TcxGroupBox;
    btnClose: TcxButton;
    cbSet: TcxButton;
    teModality: TcxComboBox;
    teSTATUS: TcxComboBox;
    procedure cbSetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    vPrEdt : integer;
  public
    procedure ShowWLForm ( pPrEdt:integer );
  end;

var
  EdtWLForm: TEdtWLForm;

implementation

Uses fMain, DB_CMN;

{$R *.dfm}

procedure TEdtWLForm.cbSetClick(Sender: TObject);
var da1, da2 : TDicomAttributes;
    dd : TDicomAttribute;
    CnsDicomConnection1 : TCnsDicomConnection;
    vDBeg, vDEnd : TDateTime;
begin // Назначить
  if (vPrEdt=2) and ( Trim(teSTATUS.Text)<>'' ) and (Trim(teSTUDYUID.Text)<>'')
  then begin // Изменить статус назначения
    da1 := TDicomAttributes.Create;
    da1.Add($0020, $000D); // STUDYUID
    da1.Add($0020, $000D).AsString[0] := Trim(teSTUDYUID.Text);
    // Performed Procedure Step Status (0040,0252) Contains the state of the Performed Procedure Step.
    // Enumerated Values: IN PROGRESS = Started but not complete DISCONTINUED = Canceled or unsuccessfully terminated COMPLETED = Successfully completed
    // cWorklistStateInProgress = 'IN PROGRESS';
    // cWorklistStateDiscounted = 'DISCONTINUED';
    // cWorklistStateCompleted  = 'COMPLETED';
    da1.Add($0040, $0252);
    da1.Add($0040, $0252).AsString[0] := teSTATUS.Text;
    CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
    try
      CnsDicomConnection1.Host := v_teWLHost;
      CnsDicomConnection1.Port := StrToInt(v_teWLPort);
      CnsDicomConnection1.CalledTitle := v_teWLCalled;
      CnsDicomConnection1.CallingTitle := v_teWLCalling;

      CnsDicomConnection1.ReceiveTimeout := 1000000;
      CnsDicomConnection1.addPresentationContext(ModalityWorklistInformationModelFIND);
      CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStep);
      CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStepRetrieve);
      CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStepNotification);

      CnsDicomConnection1.v_is_log := DB_CMN.v_LOGWorklist;
      CnsDicomConnection1.v_log_filename := ExtractFilePath(paramstr(0))+'N_CREATE.log';
      if CnsDicomConnection1.N_SET(ModalityPerformedProcedureStep, gt_uniq_str, da1)
      then
        MessageDlg('Назначение отправлено ...', mtWarning, [mbOK], 0)
      else
        ShowMessage('ERROR');
    finally
      CnsDicomConnection1.Free;
    end;
  end else if vPrEdt=1 then // добавить назначения
  begin   
    da1 := TDicomAttributes.Create;
    // AResponseDatasets.Add(da1);

    // if (Trim(vcodepage)<>'') then da1.AddVariant(dSpecificCharacterSet, vcodepage);

    // Add(8, $0000, $0800, tUS, 'DataSetType', '1');
  //  da1.Add($0000, $0800);
  //  da1.Add($0000, $0800).AsInteger[0] := DICOM_DATA_PRESENT; //DataSetType (0,8)

    da1.Add($0008, $0050); // (AccessionNumber)SH=<0>NULL
    if (Trim(teAccessionNumber.Text)<>'') then
      da1.Add($0008, $0050).AsString[0] := Trim(teAccessionNumber.Text)
    else
      da1.Add($0008, $0050);
    da1.Add($0010, $0010); // tePacFIO Пациент
    if (Trim(teP_ENAME.Text)<>'') then
      da1.Add($0010, $0010).AsString[0] := Trim(teP_ENAME.Text)
    else
      da1.Add($0010, $0010);
    da1.Add($0010, $0020); // tePatientID
    if (Trim(teP_PID.Text)<>'') then
      da1.Add($0010, $0020).AsString[0] := Trim(teP_PID.Text)
    else
      da1.Add($0010, $0020);
    da1.Add($0010, $0030); // (PatientBirthDate)DA=<0>NULL
    if ( Yearof(dtP_DATEBORN.Date)>1900 ) then
      da1.Add($0010, $0030).AsString[0] := DateToStr( dtP_DATEBORN.Date )
    else
      da1.Add($0010, $0030);
    da1.Add($0010, $0040); // Patient's Sex  Enumerated Values: M = male F = female O = other
    if (Trim(teP_SEX.Text)<>'') then
      da1.Add($0010, $0040).AsString[0] := Trim(teP_SEX.Text)
    else
      da1.Add($0010, $0040);
    da1.Add($0020, $000D); // STUDYUID
    if (Trim(teSTUDYUID.Text)<>'') then
      da1.Add($0020, $000D).AsString[0] := Trim(teSTUDYUID.Text)
    else
      da1.Add($0020, $000D);
    //
    da1.Add($0040, $1001); // Requested Procedure ID (0040,1001) O 1
   { if (Trim(p_DS.FieldByName('ProcedureID').asstring)<>'') then
      da1.Add($0040, $1001).AsString[0] := p_DS.FieldByName('ProcedureID').asstring
    else
      da1.Add($0040, $1001); }
    da1.Add($0032, $1060); // The Requested Procedure Description
    if (Trim(teProcDescription.Text)<>'') then
      da1.Add($0032, $1060).AsString[0] := Trim(teProcDescription.Text)
    else
      da1.Add($0032, $1060);
    da1.Add($0040,$1003); //  Requested Procedure Priority (0040,1003) Requested Procedure Type Urgency. Defined
                           //  Terms are: STAT, HIGH, ROUTINE, MEDIUM, LOW
    if (Trim(teProcPriority.Text)<>'') then
      da1.Add($0040,$1003).AsString[0] := Trim(teProcPriority.Text)
    else
      da1.Add($0040,$1003);
    // Performed Procedure Step Status (0040,0252) Contains the state of the Performed Procedure Step.
    // Enumerated Values: IN PROGRESS = Started but not complete
    //                    DISCONTINUED = Canceled or unsuccessfully terminated
    //                    COMPLETED = Successfully completed
    // cWorklistStateInProgress = 'IN PROGRESS';
    // cWorklistStateDiscounted = 'DISCONTINUED';
    // cWorklistStateCompleted  = 'COMPLETED';
  {  da1.Add($0040, $0252);
    if (Trim(p_DS.FieldByName('STATUS').asstring)<>'') then
      da1.Add($0040, $0252).AsString[0] := p_DS.FieldByName('STATUS').asstring
    else
      da1.Add($0040, $0252); }
    // STARTDATEWORKLIST StepStartTime
    if not TryEncodeDateTime( YearOf(deStartDateWorklist.Date) ,
                              MonthOf(deStartDateWorklist.Date),
                              DayOf(deStartDateWorklist.Date),
                              HourOf(crtTimeFromStr(teStepStartTime.Text)),
                              MinuteOf(crtTimeFromStr(teStepStartTime.Text)),
                              0,
                              0,
                              vDBeg )
    then vDBeg := now;
    // ENDDATEWORKLIST StepFinishTime
    if not TryEncodeDateTime( YearOf(deEndDateWorklist.Date) ,
                              MonthOf(deEndDateWorklist.Date),
                              DayOf(deEndDateWorklist.Date),
                              HourOf(crtTimeFromStr(teStepFinishTime.Text)),
                              MinuteOf(crtTimeFromStr(teStepFinishTime.Text)),
                              0,
                              0,
                              vDEnd )
    then vDEnd := now;
    //
    da1.Add( $0040, $0002 );
    da1.Add( $0040, $0002 ).AsDatetime[0] := vDBeg;
    da1.Add( $0040, $0002 ).AsDatetime[1] := vDEnd;
    da1.Add( $0040, $0003 );
    da1.Add( $0040, $0003 ).AsDatetime[0] := vDBeg;
    da1.Add( $0040, $0003 ).AsDatetime[1] := vDEnd;
    //
    if (Trim(teModality.Text)<>'') then   // (Modality)CS=<1>DX
      da1.Add($0008, $0060).AsString[0] := Trim(teModality.Text)
    else
      da1.Add($0008, $0060);
    if (Trim(teStationAETitle.Text)<>'') then
      da1.Add($0040, $0001).AsString[0] := Trim(teStationAETitle.Text)
    else
      da1.Add($0020, $000D);
    da1.Add($0040, $0252);
    if teSTATUS.Text='' then    
      da1.Add($0040, $0252).AsString[0] := teSTATUS.Text
    else
      da1.Add($0040, $0252).AsString[0] := 'IN PROGRESS';
    //
    dd := da1.Add($0040, $0100); //(ScheduledProcedureStepSequence)SQ=<1>Sequence Data
    da2 := TDicomAttributes.Create;
    //
    if (Trim(teModality.Text)<>'') then   // (Modality)CS=<1>DX
      da2.Add($0008, $0060).AsString[0] := Trim(teModality.Text)
    else
      da2.Add($0008, $0060);
    da2.Add($0040, $0001); // (ScheduledStationAETitle)AE=<1>HBLB
    if (Trim(teStationAETitle.Text)<>'') then
      da2.Add($0040, $0001).AsString[0] := Trim(teStationAETitle.Text)
    else
      da2.Add($0020, $000D);
    da2.Add($0040, $0006); // (ScheduledPerformingPhysiciansName)PN=<0>NULL
    if (Trim(tePhysiciansName.Text)<>'') then
      da2.Add($0040, $0006).AsString[0] := Trim(tePhysiciansName.Text)
    else
      da2.Add($0040, $0006);
    da2.Add($0040, $0007); //(ScheduledProcedureStepDescription)LO=<0>NULL
    if (Trim(teStepDescription.Text)<>'') then
      da2.Add($0040, $0007).AsString[0] := Trim(teStepDescription.Text)
    else
      da2.Add($0040, $0007);
    da2.Add($0040, $0009); //(ScheduledProcedureStepID)SH=<0>NULL
    da2.Add($0040, $0009).AsString[0] := '1';

    da2.Add($0040, $0010); //(ScheduledStationName)SH=<0>NULL
    if (Trim(teStationName.Text)<>'') then
      da2.Add($0040, $0010).AsString[0] := Trim(teStationName.Text)
    else
      da2.Add($0040, $0010);
    //
    da2.Add( $0040, $0002 );
    da2.Add( $0040, $0002 ).AsDatetime[0] := vDBeg;
    da2.Add( $0040, $0002 ).AsDatetime[1] := vDEnd;
    da2.Add( $0040, $0003 );                         // доработать потом
  //  da2.Add( $0040, $0003 ).AsDatetime[0] := vDBeg;
  //  da2.Add( $0040, $0003 ).AsDatetime[1] := vDEnd;
    //
    dd.AddData(da2);
    //
  //        ds_sav(da1,nil,nil,'.records');

    CnsDicomConnection1 := TCnsDicomConnection.Create(nil);
    try
      CnsDicomConnection1.Host := v_teWLHost;
      CnsDicomConnection1.Port := StrToInt(v_teWLPort);
      CnsDicomConnection1.CalledTitle := v_teWLCalled;
      CnsDicomConnection1.CallingTitle := v_teWLCalling;

      CnsDicomConnection1.ReceiveTimeout := 1000000;
      CnsDicomConnection1.addPresentationContext(ModalityWorklistInformationModelFIND);
      CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStep);
      CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStepRetrieve);
      CnsDicomConnection1.addPresentationContext(ModalityPerformedProcedureStepNotification);

      CnsDicomConnection1.v_is_log := v_LOGWorklist;
      CnsDicomConnection1.v_log_filename := ExtractFilePath(paramstr(0))+'N_CREATE.log';
      if CnsDicomConnection1.N_CREATE(ModalityPerformedProcedureStep, gt_uniq_str, da1)
      then
        MessageDlg('Назначение отправлено ...', mtWarning, [mbOK], 0)
      else
        ShowMessage('ERROR');
    finally
      CnsDicomConnection1.Free;
    end;
  end;
end;

procedure TEdtWLForm.FormCreate(Sender: TObject);
begin
  // ---------------------------------------------------------------------------
  // -----------------------------  TEST  --------------------------------------
  // ---------------------------------------------------------------------------
{  teP_ENAME.Text := 'TESTOV IVAN IVANOVICH' ;
  teP_PID.Text := 'MK-001/'+IntToStr(GetTickCount) ;
  teP_SEX.Text := 'M' ;
  dtP_DATEBORN.Text := '01.01.1970' ;
  teStepStartTime.Text := '01:10';
  teStepFinishTime.Text := '02:20';
  // teSTUDYUID.Text := 'teSTUDYUID' ;
  // teAccessionNumber.Text := 'teAccessionNumber' ;
  teModality.Text := 'US' ;
  tePhysiciansName.Text := 'tePhysiciansName' ;
  teStationName.Text := 'Рабочая тестовая станция' ;
  teStationAETitle.Text := 'WLSERVER' ;
  teProcPriority.Text := 'HIGH' ;
  teStepDescription.Text := 'Обычный шаг исследования' ;
  teProcDescription.Text := 'Обычная процедура' ;         }
  // teSTATUS
  // ---------------------------------------------------------------------------
  teModality.Properties.Items.Clear;
  ctrFullModList( TStringList(teModality.Properties.Items) );
end;

procedure TEdtWLForm.ShowWLForm ( pPrEdt:integer );
var vDD:TDateTime; i {,j} :integer;
  procedure SetFields;
  begin
    // Patient's Name (0010,0010) Patient's full legal name.
    EdtWLForm.teP_ENAME.Text := frmMain.mdWorklist.FieldByName('P_ENAME').AsString;
    // Patient ID (0010,0020) Primary hospital identification number or code for the patient.
    EdtWLForm.teP_PID.Text := frmMain.mdWorklist.FieldByName('P_PID').AsString;
    // Patient's Sex (0010,0040) Sex of the named Patient. Enumerated Values:
    // M = male F = female O = other
    EdtWLForm.teP_SEX.Text := frmMain.mdWorklist.FieldByName('P_SEX').AsString;
    // Add($0010, $0030); (PatientBirthDate)DA=<0>NULL
    if TryStrToDate( frmMain.mdWorklist.FieldByName('P_DATEBORN').AsString, vDD ) then
      EdtWLForm.dtP_DATEBORN.Date := vDD;
    // (ScheduledProcedureStepStartDate)DA=<1>2004-9-23
    if TryStrToDate( frmMain.mdWorklist.FieldByName('StartDateWorklist').AsString, vDD ) then
      EdtWLForm.deStartDateWorklist.Date := vDD;
    if TryStrToDate( frmMain.mdWorklist.FieldByName('EndDateWorklist').AsString, vDD ) then
      EdtWLForm.deEndDateWorklist.Date := vDD;
    // StepStartTime
    EdtWLForm.teStepStartTime.Text := frmMain.mdWorklist.FieldByName('StepStartTime').AsString;
    EdtWLForm.teStepFinishTime.Text := frmMain.mdWorklist.FieldByName('StepFinishTime').AsString;
    // STUDYUID
    EdtWLForm.teSTUDYUID.Text := frmMain.mdWorklist.FieldByName('STUDYUID').AsString;
    // (AccessionNumber)SH=<0>NULL
    EdtWLForm.teAccessionNumber.Text := frmMain.mdWorklist.FieldByName('AccessionNumber').AsString;
    //(Modality)CS=<1>DX
    EdtWLForm.teModality.Text := frmMain.mdWorklist.FieldByName('Modality').AsString;
    // (ScheduledStationAETitle)AE=<1>HBLB
    EdtWLForm.tePhysiciansName.Text := frmMain.mdWorklist.FieldByName('PhysiciansName').AsString;
    //(ScheduledStationName)SH=<0>NULL
    EdtWLForm.teStationName.Text := frmMain.mdWorklist.FieldByName('StationName').AsString;
    // (ScheduledStationAETitle)AE=<1>HBLB
    EdtWLForm.teStationAETitle.Text := frmMain.mdWorklist.FieldByName('StationAETitle').AsString;
    //  Requested Procedure Priority (0040,1003) Requested Procedure Type Urgency. Defined
              //  Terms are: STAT, HIGH, ROUTINE, MEDIUM, LOW
    EdtWLForm.teProcPriority.Text := frmMain.mdWorklist.FieldByName('ProcPriority').AsString;
    //(ScheduledProcedureStepDescription)LO=<0>NULL
    EdtWLForm.teStepDescription.Text := frmMain.mdWorklist.FieldByName('StepDescription').AsString;
    // The Requested Procedure Description
    EdtWLForm.teProcDescription.Text := frmMain.mdWorklist.FieldByName('ProcDescription').AsString;

    EdtWLForm.teSTATUS.Text := frmMain.mdWorklist.FieldByName('STATUS').AsString;

    // mdWorklist.FieldByName('StepID').AsString           := da2.GetString( $0040, $0009 ); //(ScheduledProcedureStepID)SH=<0>NULL
    // mdWorklist.FieldByName('ProcedureID').AsString        := da2.GetString( $0040, $1001 ); // Requested Procedure ID (0040,1001) O 1
  end;
begin //
  Application.CreateForm(TEdtWLForm, EdtWLForm);
  EdtWLForm.vPrEdt:=pPrEdt;
  if pPrEdt=2 then begin // Изменить статус назначения
    SetFields;
    EdtWLForm.teSTATUS.Enabled := True ;
  end else if pPrEdt=1 then // добавить назначания
  begin
    EdtWLForm.teSTATUS.Visible:=False;
    EdtWLForm.cxLabel33.Visible:=False;
    EdtWLForm.cbSet.Visible:=True;
    for i:=0 to EdtWLForm.ComponentCount-1 do
    begin
        if ( EdtWLForm.Components[i] is TcxTextEdit )
        then begin
         ( EdtWLForm.Components[i] as TcxTextEdit ).Enabled:=True;
        end else if ( EdtWLForm.Components[i] is TcxDateEdit )
        then begin
         ( EdtWLForm.Components[i] as TcxDateEdit ).Enabled:=True;
        end else if ( EdtWLForm.Components[i] is TcxComboBox )
        then begin
         ( EdtWLForm.Components[i] as TcxComboBox ).Enabled:=True;
        end;
    end;
    EdtWLForm.teSTUDYUID.Text := gt_uniq_StudyUID;
    EdtWLForm.teAccessionNumber.Text := gt_uniq_AccNmb;
    EdtWLForm.deStartDateWorklist.Date := Date;
    EdtWLForm.deEndDateWorklist.Date := Date;
    EdtWLForm.teStepStartTime.Text   := '00:00';
    EdtWLForm.teStepFinishTime.Text  := '00:00';
  end else if pPrEdt=0 then // Просмотр информации по назначению
  begin
    EdtWLForm.teAccessionNumber.Enabled := False;
    EdtWLForm.cbSet.Visible:=False;
    SetFields;
  end;
  try
    EdtWLForm.ShowModal;
  finally
    EdtWLForm.Free;
  end;
end;

end.
