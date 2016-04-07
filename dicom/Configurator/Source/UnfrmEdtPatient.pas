unit UnfrmEdtPatient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, dxSkinsCore,
  dxSkinOffice2007Black, dxSkinOffice2007Green, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, cxSpinEdit,
  ExtCtrls;

type
  TfrmEdtPatient = class(TForm)
    btnSave: TcxButton;
    btnClose: TcxButton;
    cxFAM: TcxLabel;
    teFAM: TcxTextEdit;
    cxTeName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxteSurname: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxDateBorn: TcxDateEdit;
    cxLabel4: TcxLabel;
    cxTeModality: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxTeACCESSIONNUMBER: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxTeSTUDYUID: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxDatDtudy: TcxDateEdit;
    cxLabel8: TcxLabel;
    Panel2: TPanel;
    Panel1: TPanel;
    cxseHourStudy: TcxSpinEdit;
    cxSeMinStudy: TcxSpinEdit;
    cxSeStatus: TcxSpinEdit;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxTePol: TcxTextEdit;
    cxLabel12: TcxLabel;
    cxTePatientID: TcxTextEdit;
    cxLabel13: TcxLabel;
    cxTeAETITLE: TcxTextEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEdtPatient: TfrmEdtPatient;

implementation

{$R *.dfm}

end.
