unit VolumeSelectRange;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Dcm_View, ExtCtrls, DCM_Attributes;

type
  TSelectRangeForm = class(TForm)
    Panel1: TPanel;
    DicomMultiViewer1: TDicomMultiViewer;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    procedure ScrollBar1Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure ScrollBar2Scroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure DicomMultiViewer1AfterNewDrawObject(Sender: TObject;
      AObject: TDicomDrawObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TSelectRangeForm.ScrollBar1Scroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  if ScrollPos < ScrollBar2.Position then
  begin
    if DicomMultiViewer1.ActiveView.Attributes.ImageData.FrameCount > 1 then
    begin
      DicomMultiViewer1.ActiveView.CurrentFrame := ScrollPos;
    end
    else
      DicomMultiViewer1.ActiveView.AttributesIndex := ScrollPos;
  end
  else
    ScrollPos := ScrollBar2.Position - 1;
end;

procedure TSelectRangeForm.ScrollBar2Scroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  if ScrollPos > ScrollBar1.Position then
  begin
    if DicomMultiViewer1.ActiveView.Attributes.ImageData.FrameCount > 1 then
      DicomMultiViewer1.ActiveView.CurrentFrame := ScrollPos
    else
      DicomMultiViewer1.ActiveView.AttributesIndex := ScrollPos;
  end
  else
    ScrollPos := ScrollBar1.Position + 1;
end;

procedure TSelectRangeForm.DicomMultiViewer1AfterNewDrawObject(
  Sender: TObject; AObject: TDicomDrawObject);
begin
  DicomMultiViewer1.ActiveView.LeaderMouserInspect := ldmiNone;
end;

procedure TSelectRangeForm.Button1Click(Sender: TObject);
begin
  DicomMultiViewer1.ActiveView.LeaderMouserInspect := ldmiSelectRect;
end;

end.

