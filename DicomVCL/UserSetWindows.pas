{*******************************************************}
{							                                          }
{       Delphi DicomVCL Component Library	            	}
{       DicomVCL include file				                    }
{                                                       }
{       Copyright (c) 1999,2008 by Jiawen Feng	      	}
{                                                       }
{*******************************************************}
unit UserSetWindows;
{$I DicomPack.inc}

interface

uses
  Windows, Messages, SysUtils, {$IFDEF LEVEL6}Variants, {$ENDIF}Classes, Graphics, Controls, Forms,
  Dialogs, DB, DCM_MemTable, StdCtrls, Buttons, ExtCtrls,
  Grids, DBGrids, cnsmsg;

type
  TUserSettingForm = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TheModility: string;
    procedure KxDataset1AfterInsert(DataSet: TDataSet);
  end;
implementation

{$R *.dfm}

procedure TUserSettingForm.KxDataset1AfterInsert(DataSet: TDataSet);
begin
  DataSource1.DataSet.FieldByName('MODALITY').AsString := TheModility;
end;

procedure TUserSettingForm.FormShow(Sender: TObject);
begin
  Caption := '"' + TheModility + cns_UserSetWindow;
end;

procedure TUserSettingForm.FormCreate(Sender: TObject);
begin
  self.Font.Charset := GB2312_CHARSET;
  self.Font.name := cns_FormDefaultFontName;
  self.Font.Size := 9;

end;

end.

