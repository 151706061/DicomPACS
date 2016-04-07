unit fTAGSEdt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinOffice2007Black, dxSkinOffice2007Green,
  cxLookAndFeelPainters, cxGroupBox, cxTextEdit, cxControls, cxContainer,
  cxEdit, cxLabel, Menus, ActnList, StdCtrls, cxButtons, Medotrade;

type
  TFTAGS = class(TForm)
    cxlbl12: TcxLabel;
    FC_IMAGETYPE_1: TcxTextEdit;
    gbPriemTAGS: TcxGroupBox;
    FC_IMAGETYPE_2: TcxTextEdit;
    cxLabel1: TcxLabel;
    FC_STUDYID_1: TcxTextEdit;
    FC_STUDYID_2: TcxTextEdit;
    FC_STUDYDESCRIPTION_2: TcxTextEdit;
    FC_PATIENTID_2: TcxTextEdit;
    FC_PATIENTID_1: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    FC_STUDYDESCRIPTION_1: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    FC_STUDYUID_1: TcxTextEdit;
    FC_DT_1: TcxTextEdit;
    FC_DA_1: TcxTextEdit;
    FC_ACCESSIONNUMBER_1: TcxTextEdit;
    FC_ACCESSIONNUMBER_2: TcxTextEdit;
    FC_DA_2: TcxTextEdit;
    FC_DT_2: TcxTextEdit;
    FC_STUDYUID_2: TcxTextEdit;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    FC_PSEX_1: TcxTextEdit;
    FC_PSEX_2: TcxTextEdit;
    FC_AID_1: TcxTextEdit;
    FC_AID_2: TcxTextEdit;
    FC_ACQNUM_1: TcxTextEdit;
    FC_ACQNUM_2: TcxTextEdit;
    FC_SERIESUID_1: TcxTextEdit;
    FC_SERIESUID_2: TcxTextEdit;
    FC_PNAME_1: TcxTextEdit;
    FC_PNAME_2: TcxTextEdit;
    FC_PDATEBORN_1: TcxTextEdit;
    FC_PDATEBORN_2: TcxTextEdit;
    FC_PHYSNAME_1: TcxTextEdit;
    FC_PHYSNAME_2: TcxTextEdit;
    FC_INSTANCEUID_1: TcxTextEdit;
    FC_INSTANCEUID_2: TcxTextEdit;
    cxLabel16: TcxLabel;
    FC_KIN_1: TcxTextEdit;
    FC_KIN_2: TcxTextEdit;
    btnClose: TcxButton;
    cxButton3: TcxButton;
    ActionList1: TActionList;
    actOK: TAction;
    actCancels: TAction;
    actSetDefault: TAction;
    cxLabel17: TcxLabel;
    FC_SERNUM_1: TcxTextEdit;
    FC_SERNUM_2: TcxTextEdit;
    cxButton1: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actSetDefaultExecute(Sender: TObject);
    procedure actCancelsExecute(Sender: TObject);
  private
    { Private declarations }
  public
    v_AETITLE : string;
    procedure SetDefault;
  end;

var
  FTAGS: TFTAGS;

implementation

Uses fMain;

{$R *.dfm}

procedure TFTAGS.actCancelsExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFTAGS.actOKExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFTAGS.SetDefault;
begin // установить значения по умолчанию
  // Модальность (CS Modality)
  FTAGS.FC_IMAGETYPE_1.Text := '8' ;
  FTAGS.FC_IMAGETYPE_2.Text := '60' ;
  // ID исследования (StudyID)
  FTAGS.FC_STUDYID_1.Text := '20' ;
  FTAGS.FC_STUDYID_2.Text := '10' ;
  // ID пациента (PatientID)
  FTAGS.FC_PATIENTID_1.Text := '10' ;
  FTAGS.FC_PATIENTID_2.Text := '20' ;
  // Комментарий-описание к исследованию (Study Description)
  FTAGS.FC_STUDYDESCRIPTION_1.Text := '8' ;
  FTAGS.FC_STUDYDESCRIPTION_2.Text := '1030' ;
  // Номер протокола исследования
  FC_ACCESSIONNUMBER_1.Text := '8' ;
  FC_ACCESSIONNUMBER_2.Text := '50' ;
  // Дата исследования (Study Date)
  FC_DA_1.Text := '8' ;
  FC_DA_2.Text := '20' ;
  // Время исследования (Study Time)
  FC_DT_1.Text := '8' ;
  FC_DT_2.Text := '30' ;
  // Study Instance UID
  FC_STUDYUID_1.Text := '20' ;
  FC_STUDYUID_2.Text := 'D' ;
  // Series Instanse UID
  FC_SERIESUID_1.Text := '20' ;
  FC_SERIESUID_2.Text := 'E' ;
  // Series Number
  FC_SERNUM_1.Text := '20' ;
  FC_SERNUM_2.Text := '11' ;
  // ФИО врача (Referring Physicians Name)
  FC_PHYSNAME_1.Text := '8' ;
  FC_PHYSNAME_2.Text := '90' ;
  // ФИО пациента (Patient Name)
  FC_PNAME_1.Text := '10' ;
  FC_PNAME_2.Text := '10' ;
  // Дата рождения пациента (Patient Birth Date)
  FC_PDATEBORN_1.Text := '10' ;
  FC_PDATEBORN_2.Text := '30' ;
  // Пол пациента (Patient Sex)
  FC_PSEX_1.Text := '10' ;
  FC_PSEX_2.Text := '40' ;
  // Instance Number
  FC_AID_1.Text := '20' ;
  FC_AID_2.Text := '13' ;
   // Acquisition Number
  FC_ACQNUM_1.Text := '20' ;
  FC_ACQNUM_2.Text := '12' ;
  // SOP Instanse UID
  FC_INSTANCEUID_1.Text := '8' ;
  FC_INSTANCEUID_2.Text := '18' ;
  // KIN $2809, $001D - временный тег
  FC_KIN_1.Text := '2809' ;
  FC_KIN_2.Text := '001D' ;
end;

procedure TFTAGS.actSetDefaultExecute(Sender: TObject);
begin // установить значения по умолчанию
  SetDefault;
end;

procedure TFTAGS.btnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFTAGS.FormShow(Sender: TObject);
begin
  gbPriemTAGS.Caption := FTAGS.v_AETITLE;
end;

end.
