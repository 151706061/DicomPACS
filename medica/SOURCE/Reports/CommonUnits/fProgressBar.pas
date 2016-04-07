unit fProgressBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxProgressBar;

type
  TfrmProgressBar = class(TForm)
    cxProgressBar1: TcxProgressBar;
    laProgressText: TcxLabel;
  private
    { Private declarations }
    procedure SetMinValue(aValue : Double);
    function  GetMinValue : Double;
    procedure SetMaxValue(aValue : Double);
    function  GetMaxValue : Double;
    procedure SetCurValue(aValue : Double);
    function  GetCurValue : Double;
    function  GetProgressText : string;
    procedure SetProgressText(aValue : string);

  public
    { Public declarations }
    property MinValue     : Double read GetMinValue     write SetMinValue;
    property MaxValue     : Double read GetMaxValue     write SetMaxValue;
    property CurValue     : Double read GetCurValue     write SetCurValue;
    property ProgressText : string read GetProgressText write SetProgressText;

    constructor Create(AOwner: TComponent; aProgressText : string; aFormCaption : string = ''; aCurValue : Double = 0; aMinValue : Double = 0;  aMaxValue : Double = 100 ); reintroduce;
  end;

implementation

{$R *.dfm}

{ TForm1 }
//==============================================================================
constructor TfrmProgressBar.Create(AOwner: TComponent;
                                   aProgressText: string; aFormCaption : string;
                                   aCurValue, aMinValue, aMaxValue: Double);
begin
  inherited Create(AOwner);
  MinValue     := aMinValue;
  MaxValue     := aMaxValue;
  CurValue     := aCurValue;
  ProgressText := aProgressText;
  Self.Caption := aFormCaption;
end;
//------------------------------------------------------------------------------
function TfrmProgressBar.GetProgressText: string;
begin
  Result := laProgressText.Caption;
end;
//------------------------------------------------------------------------------
procedure TfrmProgressBar.SetProgressText(aValue: string);
begin
  laProgressText.Caption := aValue;
end;
//------------------------------------------------------------------------------
function TfrmProgressBar.GetCurValue: Double;
begin
  Result := cxProgressBar1.Position;
end;
//------------------------------------------------------------------------------
procedure TfrmProgressBar.SetCurValue(aValue: Double);
begin
  cxProgressBar1.Position := aValue;
end;
//------------------------------------------------------------------------------
function TfrmProgressBar.GetMaxValue: Double;
begin
  Result := cxProgressBar1.Properties.Max;
end;
//------------------------------------------------------------------------------
procedure TfrmProgressBar.SetMaxValue(aValue: Double);
begin
  cxProgressBar1.Properties.Max := aValue;
end;
//------------------------------------------------------------------------------
function TfrmProgressBar.GetMinValue: Double;
begin
  Result := cxProgressBar1.Properties.Min;
end;
//------------------------------------------------------------------------------
procedure TfrmProgressBar.SetMinValue(aValue: Double);
begin
  cxProgressBar1.Properties.Min := aValue;
end;
//==============================================================================
end.
