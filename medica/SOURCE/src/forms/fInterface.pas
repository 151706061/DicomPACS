//==============================================================================
// модуль для настроек интерфейса пользователя
// по нажатию кнопки ОК происходит применение настроек и сохранение.
//------------------------------------------------------------------------------
// на данный момент настраиваются только цвета четных и нечетных строк таблиц.
// Added by Voronov 05.03.2008 10:08:51
//==============================================================================
unit fInterface;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxColorComboBox, ExtCtrls, cxControls, cxContainer, cxEdit, cxGroupBox, fdmMain,
  Menus, cxLookAndFeelPainters, JvComponentBase, JvFormPlacement, cxLabel,
  StdCtrls, cxButtons, cxButtonEdit;

type
  TfmInterface = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Bevel1: TBevel;
    buOK: TcxButton;
    buCancel: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    JvFormStorage1: TJvFormStorage;
    ColorDialog1: TColorDialog;
    bedMasterTableColorBgndEven: TcxButtonEdit;
    bedMasterTableColorBgndOdd: TcxButtonEdit;
    bedDetailTableColorBgndEven: TcxButtonEdit;
    bedDetailTableColorBgndOdd: TcxButtonEdit;
    procedure bedMasterTableColorBgndEvenPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure buOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmInterface: TfmInterface;

  procedure DoShowInterface;

implementation

{$R *.dfm}

procedure DoShowInterface;
begin
  fmInterface := TfmInterface.Create(Application);
  fmInterface.ShowModal;
  fmInterface.Free;
end;

procedure TfmInterface.bedMasterTableColorBgndEvenPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ColorDialog1.Color := TcxButtonEdit(Sender).Style.Color;
  if ColorDialog1.Execute then TcxButtonEdit(Sender).Style.Color := ColorDialog1.Color;
end;

procedure TfmInterface.buOKClick(Sender: TObject);
begin
  dmMain.cxStyleGridEvenRow.Color       := bedMasterTableColorBgndEven.Style.Color;
  dmMain.cxStyleGridOddRow.Color        := bedMasterTableColorBgndOdd.Style.Color;
  dmMain.cxStyleGridDetailEvenRow.Color := bedDetailTableColorBgndEven.Style.Color;
  dmMain.cxStyleGridDetailOddRow.Color  := bedDetailTableColorBgndOdd.Style.Color;
  dmMain.SaveInterfaceParams;
end;

procedure TfmInterface.FormShow(Sender: TObject);
begin
  bedMasterTableColorBgndEven.Style.Color := dmMain.cxStyleGridEvenRow.Color      ;
  bedMasterTableColorBgndOdd.Style.Color  := dmMain.cxStyleGridOddRow.Color       ;
  bedDetailTableColorBgndEven.Style.Color := dmMain.cxStyleGridDetailEvenRow.Color;
  bedDetailTableColorBgndOdd.Style.Color  := dmMain.cxStyleGridDetailOddRow.Color ;
end;

end.
