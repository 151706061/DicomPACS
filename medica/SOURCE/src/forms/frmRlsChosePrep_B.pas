unit frmRlsChosePrep_B;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TPrepInfo = record
    FC_EANCODE : String;

    FC_PREP : string;
    FK_ID   : Integer;

    LATINE_NAME_NDV : string;
    NAME_INTERNATIONAL : string;

    FK_DFMASS_IS_NULL : Boolean;
    DFMASS : Double;
    FK_DFMASS : Integer;

    FK_MASSUNIT_IS_NULL : Boolean;
    DRUGSINPPACK : Double;
    FK_MASSUNIT  : Integer;

    FARMGRID : variant;
  end;

  TframeRlsChosePrep_B = class(TFrame)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OnFormShow(aEanCode : String = ''; aNomenID : Integer = -1; aFilterChoice : Integer = 0; aFilterText : string = '' );       virtual; abstract;
    procedure OnFormApplyFilterExecute;                                           virtual; abstract;
    procedure OnFormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);  virtual; abstract;
    procedure UpdateCurrentPrep(var aPrepInfo  : TPrepInfo );                     virtual; abstract;
    procedure GetCurrentFilter(var aFilterChoice : Integer; var aFilterText : string); virtual; abstract;

//    constructor Create (AOwner : TComponent); overload;
  end;

implementation

{$R *.DFM}

end.
