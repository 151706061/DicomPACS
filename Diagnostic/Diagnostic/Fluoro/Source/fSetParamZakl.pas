unit fSetParamZakl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, dxSkinsCore, dxSkinsDefaultPainters,
  Menus, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxControls,
  cxInplaceContainer, cxVGrid, cxCalendar, cxButtonEdit, cxTextEdit,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, ExtCtrls;

type
  TfrmSetParamZakl = class(TForm)
    vGrPar: TcxVerticalGrid;
    al: TActionList;
    aOk: TAction;
    aCancel: TAction;
    catCaption1: TcxCategoryRow;
    rowZakl1: TcxEditorRow;
    rowZakl2: TcxEditorRow;
    catDates: TcxCategoryRow;
    rowDate1: TcxEditorRow;
    rowDate2: TcxEditorRow;
    aPeriod: TAction;
    Panel1: TPanel;
    cxButton2: TcxButton;
    bOk: TcxButton;
    cxButton1: TcxButton;
    procedure aOkExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aPeriodExecute(Sender: TObject);
    procedure rowZakl1EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rowZakl2EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetParamZakl: TfrmSetParamZakl;

implementation
uses uPeriod, fSetResume;
{$R *.dfm}

procedure TfrmSetParamZakl.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSetParamZakl.aOkExecute(Sender: TObject);
begin
  if (rowZakl1.Tag <> 0) and (rowZakl2.Tag <> 0) then
    begin
      Application.MessageBox('Вы не можете выбрать одновременно 2 заключения!', 'Внимание', mb_iconwarning+mb_ok);
      exit;
    end;
  if (rowZakl1.Tag = 0) and (rowZakl2.Tag = 0) then
    begin
      Application.MessageBox('Вы не выбрали заключение!'+#13+'Чтобы собрать журнал заключений необходимо выбрать либо "Заключение 1", либо "Заключение 2"!', 'Внимание', mb_iconwarning+mb_ok);
      exit;
    end;

  ModalResult := mrOk;
end;

procedure TfrmSetParamZakl.aPeriodExecute(Sender: TObject);
begin
  with TfrmParamDate.Create(Self) do
    begin
      if Execute then
				begin
					if ModalResult = MrOK then
						begin
              rowDate1.Properties.Value := Period.First;
              rowDate2.Properties.Value := Period.Last;
 	 				  end;
				end;
    Free;
	end;
end;

procedure TfrmSetParamZakl.rowZakl1EditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetResume, frmSetResume);
      try
        frmSetResume.DoShowForm;
        frmSetResume.ShowModal;
        if frmSetResume.ModalResult = mrOk then
          begin
            TcxButtonEdit(vGrPar.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGrPar.InplaceEditor).EditingText := frmSetResume.odsTree.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(vGrPar.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            rowZakl1.Tag := frmSetResume.odsTree.FieldByName('FK_ID').AsInteger;
          end;
      finally
        frmSetResume.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      TcxButtonEdit(vGrPar.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGrPar.InplaceEditor).EditingText := '';
      TcxButtonEdit(vGrPar.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowZakl1.Tag := 0;
    end; 
end;

procedure TfrmSetParamZakl.rowZakl2EditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 0 then
    begin
      Application.CreateForm(TfrmSetResume, frmSetResume);
      try
        frmSetResume.DoShowForm;
        frmSetResume.ShowModal;
        if frmSetResume.ModalResult = mrOk then
          begin
            TcxButtonEdit(vGrPar.InplaceEditor).Properties.ViewStyle := vsNormal;
            TcxButtonEdit(vGrPar.InplaceEditor).EditingText := frmSetResume.odsTree.FieldByName('FC_NAME').AsString;
            TcxButtonEdit(vGrPar.InplaceEditor).Properties.ViewStyle := vsHideCursor;
            rowZakl2.Tag := frmSetResume.odsTree.FieldByName('FK_ID').AsInteger;
          end;
      finally
        frmSetResume.Free;
      end;
    end;
  if AButtonIndex = 1 then
    begin
      TcxButtonEdit(vGrPar.InplaceEditor).Properties.ViewStyle := vsNormal;
      TcxButtonEdit(vGrPar.InplaceEditor).EditingText := '';
      TcxButtonEdit(vGrPar.InplaceEditor).Properties.ViewStyle := vsHideCursor;
      rowZakl2.Tag := 0;
    end;
end;

end.
