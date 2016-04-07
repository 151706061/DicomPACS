unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JclFileUtils, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, dxBar, Oracle, ImgList, ActnList, OracleData, cxClasses,
  dxSkinscxPCPainter, cxPC, cxControls, cxContainer, cxEdit, cxTextEdit, Menus,
  cxMemo, DB, cxSplitter, ExtCtrls, cxGroupBox, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGraphics,
  cxCheckBox, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, uGlobalConst, SMMainAPI,
  dxSkinOffice2007Green;

type
  TfrmMain = class(TForm)
    AL: TActionList;
    IL: TImageList;
    os: TOracleSession;
    BM: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BMBar1: TdxBar;
    bbClose: TdxBarButton;
    aClose: TAction;
    cxPageControl1: TcxPageControl;
    cxTS_5110: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    cxTabSheet6: TcxTabSheet;
    e00_5110_1_3: TcxTextEdit;
    pmMain: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    cxMemo1: TcxMemo;
    cxMemo2: TcxMemo;
    cxMemo3: TcxMemo;
    cxMemo4: TcxMemo;
    cxMemo5: TcxMemo;
    cxMemo6: TcxMemo;
    cxMemo7: TcxMemo;
    cxMemo8: TcxMemo;
    cxMemo9: TcxMemo;
    cxMemo10: TcxMemo;
    cxMemo11: TcxMemo;
    cxMemo12: TcxMemo;
    cxMemo13: TcxMemo;
    cxMemo14: TcxMemo;
    cxMemo15: TcxMemo;
    cxMemo16: TcxMemo;
    cxMemo17: TcxMemo;
    cxMemo18: TcxMemo;
    cxMemo19: TcxMemo;
    cxMemo20: TcxMemo;
    cxMemo21: TcxMemo;
    cxMemo22: TcxMemo;
    cxMemo23: TcxMemo;
    cxMemo24: TcxMemo;
    cxMemo25: TcxMemo;
    cxMemo26: TcxMemo;
    cxMemo27: TcxMemo;
    cxMemo28: TcxMemo;
    cxMemo29: TcxMemo;
    cxMemo30: TcxMemo;
    e20_5110_3_3: TcxTextEdit;
    e30_5110_4_3: TcxTextEdit;
    e40_5110_5_3: TcxTextEdit;
    e60_5110_7_3: TcxTextEdit;
    e70_5110_8_3: TcxTextEdit;
    e80_5110_9_3: TcxTextEdit;
    e90_5110_10_3: TcxTextEdit;
    cxMemo31: TcxMemo;
    cxMemo32: TcxMemo;
    cxMemo33: TcxMemo;
    cxMemo34: TcxMemo;
    cxMemo35: TcxMemo;
    cxMemo36: TcxMemo;
    cxMemo37: TcxMemo;
    cxMemo38: TcxMemo;
    cxMemo39: TcxMemo;
    cxMemo40: TcxMemo;
    e01_5110_1_4: TcxTextEdit;
    e02_5110_1_5: TcxTextEdit;
    e03_5110_1_6: TcxTextEdit;
    e04_5110_1_7: TcxTextEdit;
    e05_5110_1_8: TcxTextEdit;
    e06_5110_1_9: TcxTextEdit;
    e11_5110_2_4: TcxTextEdit;
    e21_5110_3_4: TcxTextEdit;
    e31_5110_4_4: TcxTextEdit;
    e61_5110_7_4: TcxTextEdit;
    e71_5110_8_4: TcxTextEdit;
    e81_5110_9_4: TcxTextEdit;
    e41_5110_5_4: TcxTextEdit;
    e91_5110_10_4: TcxTextEdit;
    e12_5110_2_5: TcxTextEdit;
    e22_5110_3_5: TcxTextEdit;
    e32_5110_4_5: TcxTextEdit;
    e62_5110_7_5: TcxTextEdit;
    e72_5110_8_5: TcxTextEdit;
    e82_5110_9_5: TcxTextEdit;
    e92_5110_10_5: TcxTextEdit;
    e42_5110_5_5: TcxTextEdit;
    e13_5110_2_6: TcxTextEdit;
    e23_5110_3_6: TcxTextEdit;
    e33_5110_4_6: TcxTextEdit;
    e43_5110_5_6: TcxTextEdit;
    e13_5110_2_7: TcxTextEdit;
    e24_5110_3_7: TcxTextEdit;
    e34_5110_4_7: TcxTextEdit;
    e44_5110_5_7: TcxTextEdit;
    e63_5110_7_6: TcxTextEdit;
    e73_5110_8_6: TcxTextEdit;
    e83_5110_9_6: TcxTextEdit;
    e93_5110_10_6: TcxTextEdit;
    e64_5110_7_7: TcxTextEdit;
    e74_5110_8_7: TcxTextEdit;
    e84_5110_9_7: TcxTextEdit;
    e94_5110_10_7: TcxTextEdit;
    e15_5110_2_8: TcxTextEdit;
    e25_5110_3_8: TcxTextEdit;
    e35_5110_4_8: TcxTextEdit;
    e45_5110_5_8: TcxTextEdit;
    e16_5110_2_9: TcxTextEdit;
    e26_5110_3_9: TcxTextEdit;
    e36_5110_4_9: TcxTextEdit;
    e46_5110_5_9: TcxTextEdit;
    e65_5110_7_8: TcxTextEdit;
    e75_5110_8_8: TcxTextEdit;
    e85_5110_9_8: TcxTextEdit;
    e95_5110_10_8: TcxTextEdit;
    e66_5110_7_9: TcxTextEdit;
    e76_5110_8_9: TcxTextEdit;
    e86_5110_9_9: TcxTextEdit;
    e96_5110_10_9: TcxTextEdit;
    e50_5110_6_3: TcxTextEdit;
    e51_5110_6_4: TcxTextEdit;
    e53_5110_6_6: TcxTextEdit;
    e54_5110_6_7: TcxTextEdit;
    e52_5110_6_5: TcxTextEdit;
    e55_5110_6_8: TcxTextEdit;
    e56_5110_6_9: TcxTextEdit;
    e10_5110_2_3: TcxTextEdit;
    N3: TMenuItem;
    cxMemo41: TcxMemo;
    cxMemo42: TcxMemo;
    cxMemo43: TcxMemo;
    cxMemo44: TcxMemo;
    cxMemo45: TcxMemo;
    cxMemo46: TcxMemo;
    cxMemo47: TcxMemo;
    cxMemo48: TcxMemo;
    cxMemo49: TcxMemo;
    cxMemo50: TcxMemo;
    e00_5111_1: TcxTextEdit;
    e10_5111_2: TcxTextEdit;
    e20_5111_3: TcxTextEdit;
    e30_5111_4: TcxTextEdit;
    cxMemo51: TcxMemo;
    cxMemo52: TcxMemo;
    cxMemo53: TcxMemo;
    cxMemo54: TcxMemo;
    cxMemo55: TcxMemo;
    cxMemo56: TcxMemo;
    cxMemo57: TcxMemo;
    cxMemo58: TcxMemo;
    cxMemo59: TcxMemo;
    cxMemo60: TcxMemo;
    cxMemo61: TcxMemo;
    cxMemo62: TcxMemo;
    cxMemo63: TcxMemo;
    cxMemo64: TcxMemo;
    e00_5112_1: TcxTextEdit;
    e10_5112_2: TcxTextEdit;
    e20_5112_3: TcxTextEdit;
    e30_5112_4: TcxTextEdit;
    e40_5112_5: TcxTextEdit;
    e50_5112_6: TcxTextEdit;
    e60_5112_7: TcxTextEdit;
    cxMemo65: TcxMemo;
    cxMemo71: TcxMemo;
    cxMemo72: TcxMemo;
    cxMemo73: TcxMemo;
    cxMemo74: TcxMemo;
    cxMemo75: TcxMemo;
    cxMemo76: TcxMemo;
    e00_5113_1_3: TcxTextEdit;
    e10_5113_2_3: TcxTextEdit;
    e20_5113_3_3: TcxTextEdit;
    e30_5113_4_3: TcxTextEdit;
    e40_5113_5_3: TcxTextEdit;
    cxMemo77: TcxMemo;
    cxMemo78: TcxMemo;
    cxMemo79: TcxMemo;
    cxMemo80: TcxMemo;
    cxMemo81: TcxMemo;
    cxMemo82: TcxMemo;
    cxMemo83: TcxMemo;
    cxMemo84: TcxMemo;
    cxMemo85: TcxMemo;
    cxMemo86: TcxMemo;
    cxMemo87: TcxMemo;
    cxMemo88: TcxMemo;
    cxMemo89: TcxMemo;
    cxMemo90: TcxMemo;
    e00_5114_1_3: TcxTextEdit;
    e01_5114_1_4: TcxTextEdit;
    e11_5114_2_4: TcxTextEdit;
    e10_5114_2_3: TcxTextEdit;
    e20_5114_3_3: TcxTextEdit;
    e21_5114_3_4: TcxTextEdit;
    e30_5114_4_3: TcxTextEdit;
    e31_5114_4_4: TcxTextEdit;
    e40_5114_5_3: TcxTextEdit;
    e41_5114_5_4: TcxTextEdit;
    e50_5114_6_3: TcxTextEdit;
    e51_5114_6_4: TcxTextEdit;
    cxMemo91: TcxMemo;
    cxMemo92: TcxMemo;
    cxMemo93: TcxMemo;
    cxMemo94: TcxMemo;
    cxMemo95: TcxMemo;
    cxMemo96: TcxMemo;
    cxMemo97: TcxMemo;
    cxMemo98: TcxMemo;
    cxMemo99: TcxMemo;
    cxMemo100: TcxMemo;
    cxMemo101: TcxMemo;
    cxMemo102: TcxMemo;
    cxMemo103: TcxMemo;
    cxMemo104: TcxMemo;
    cxMemo105: TcxMemo;
    cxMemo106: TcxMemo;
    cxMemo107: TcxMemo;
    cxMemo108: TcxMemo;
    cxMemo109: TcxMemo;
    cxMemo110: TcxMemo;
    cxMemo111: TcxMemo;
    cxMemo112: TcxMemo;
    cxMemo113: TcxMemo;
    cxMemo114: TcxMemo;
    cxMemo115: TcxMemo;
    cxMemo116: TcxMemo;
    cxMemo117: TcxMemo;
    cxMemo118: TcxMemo;
    cxMemo119: TcxMemo;
    cxMemo120: TcxMemo;
    cxMemo121: TcxMemo;
    cxMemo122: TcxMemo;
    cxMemo123: TcxMemo;
    cxMemo124: TcxMemo;
    cxMemo125: TcxMemo;
    cxMemo126: TcxMemo;
    cxMemo127: TcxMemo;
    cxMemo128: TcxMemo;
    e00_5119_1_3: TcxTextEdit;
    e10_5119_2_3: TcxTextEdit;
    e20_5119_3_3: TcxTextEdit;
    e30_5119_4_3: TcxTextEdit;
    e40_5119_5_3: TcxTextEdit;
    e50_5119_6_3: TcxTextEdit;
    e60_5119_7_3: TcxTextEdit;
    e70_5119_8_3: TcxTextEdit;
    e80_5119_9_3: TcxTextEdit;
    e90_5119_10_3: TcxTextEdit;
    e100_5119_11_3: TcxTextEdit;
    e110_5119_12_3: TcxTextEdit;
    e01_5119_1_4: TcxTextEdit;
    e11_5119_2_4: TcxTextEdit;
    e21_5119_3_4: TcxTextEdit;
    e31_5119_4_4: TcxTextEdit;
    e41_5119_5_4: TcxTextEdit;
    e51_5119_6_4: TcxTextEdit;
    e61_5119_7_4: TcxTextEdit;
    e71_5119_8_4: TcxTextEdit;
    e81_5119_9_4: TcxTextEdit;
    e91_5119_10_4: TcxTextEdit;
    e101_5119_11_4: TcxTextEdit;
    e111_5119_12_4: TcxTextEdit;
    e02_5119_1_5: TcxTextEdit;
    e12_5119_2_5: TcxTextEdit;
    e22_5119_3_5: TcxTextEdit;
    e32_5119_4_5: TcxTextEdit;
    e42_5119_5_5: TcxTextEdit;
    e52_5119_6_5: TcxTextEdit;
    e62_5119_7_5: TcxTextEdit;
    e72_5119_8_5: TcxTextEdit;
    e82_5119_9_5: TcxTextEdit;
    e92_5119_10_5: TcxTextEdit;
    e102_5119_11_5: TcxTextEdit;
    e112_5119_12_5: TcxTextEdit;
    e03_5119_1_6: TcxTextEdit;
    e13_5119_2_6: TcxTextEdit;
    e23_5119_3_6: TcxTextEdit;
    e33_5119_4_6: TcxTextEdit;
    e43_5119_5_6: TcxTextEdit;
    e53_5119_6_6: TcxTextEdit;
    e63_5119_7_6: TcxTextEdit;
    e73_5119_8_6: TcxTextEdit;
    e83_5119_9_6: TcxTextEdit;
    e93_5119_10_6: TcxTextEdit;
    e103_5119_11_6: TcxTextEdit;
    e116_5119_12_6: TcxTextEdit;
    paParams: TPanel;
    cxSplitter1: TcxSplitter;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxDateBeg: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxDateEnd: TcxDateEdit;
    bbSetPeriod: TcxButton;
    Label1: TLabel;
    cxSotr: TcxLookupComboBox;
    Label2: TLabel;
    cxKab: TcxLookupComboBox;
    cxDez: TcxCheckBox;
    bbCalculateCell: TcxButton;
    aCalculateCell: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    aCalculateTable: TAction;
    aCalculateReport: TAction;
    odsSotr: TOracleDataSet;
    dsSotr: TDataSource;
    odsKab: TOracleDataSet;
    dsKab: TDataSource;
    cxMemo129: TcxMemo;
    cxMemo130: TcxMemo;
    cxMemo131: TcxMemo;
    cxMemo132: TcxMemo;
    cxMemo133: TcxMemo;
    cxMemo134: TcxMemo;
    cxGroupBox3: TcxGroupBox;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    aMetodics: TAction;
    aDetail: TAction;
    aInfo: TAction;
    cxButton6: TcxButton;
    pmMain_4longcaptions: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    cxMemo135: TcxMemo;
    cxMemo136: TcxMemo;
    cxMemo137: TcxMemo;
    cxMemo138: TcxMemo;
    cxTextEdit1: TcxTextEdit;
    e101_5110_11_4: TcxTextEdit;
    e102_5110_11_5: TcxTextEdit;
    e103_5110_11_6: TcxTextEdit;
    e104_5110_11_7: TcxTextEdit;
    e105_5110_11_8: TcxTextEdit;
    e106_5110_11_9: TcxTextEdit;
    cxTextEdit8: TcxTextEdit;
    e111_5110_12_4: TcxTextEdit;
    e112_5110_12_5: TcxTextEdit;
    e113_5110_12_6: TcxTextEdit;
    e114_5110_12_7: TcxTextEdit;
    e115_5110_12_8: TcxTextEdit;
    e116_5110_12_9: TcxTextEdit;
    cxMemo139: TcxMemo;
    cxMemo140: TcxMemo;
    e07_5110_1_10: TcxTextEdit;
    e17_5110_2_10: TcxTextEdit;
    e27_5110_3_10: TcxTextEdit;
    e37_5110_4_10: TcxTextEdit;
    e47_5110_5_10: TcxTextEdit;
    e67_5110_7_10: TcxTextEdit;
    e77_5110_8_10: TcxTextEdit;
    e87_5110_9_10: TcxTextEdit;
    e97_5110_10_10: TcxTextEdit;
    e107_5110_11_10: TcxTextEdit;
    e117_5110_12_10: TcxTextEdit;
    e57_5110_6_10: TcxTextEdit;
    cxMemo142: TcxMemo;
    cxMemo143: TcxMemo;
    cxMemo144: TcxMemo;
    cxMemo145: TcxMemo;
    cxMemo146: TcxMemo;
    cxMemo147: TcxMemo;
    cxMemo150: TcxMemo;
    cxMemo151: TcxMemo;
    cxMemo152: TcxMemo;
    e50_5113_6_3: TcxTextEdit;
    e80_5113_9: TcxTextEdit;
    e90_5113_10: TcxTextEdit;
    e100_5113_11: TcxTextEdit;
    pmSpec: TPopupMenu;
    N4: TMenuItem;
    pmSpecial4One: TPopupMenu;
    N5: TMenuItem;
    cxMemo153: TcxMemo;
    cxMemo154: TcxMemo;
    cxMemo155: TcxMemo;
    cxMemo156: TcxMemo;
    cxMemo157: TcxMemo;
    cxMemo158: TcxMemo;
    cxMemo159: TcxMemo;
    cxMemo160: TcxMemo;
    e40_5111_5: TcxTextEdit;
    e50_5111_6: TcxTextEdit;
    e60_5111_7: TcxTextEdit;
    e70_5111_8: TcxTextEdit;
    cxMemo161: TcxMemo;
    cxMemo162: TcxMemo;
    cxMemo163: TcxMemo;
    cxTextEdit2: TcxTextEdit;
    e121_5110_13_4: TcxTextEdit;
    e122_5110_13_5: TcxTextEdit;
    e123_5110_13_6: TcxTextEdit;
    e124_5110_13_7: TcxTextEdit;
    e125_5110_13_8: TcxTextEdit;
    e126_5110_13_9: TcxTextEdit;
    e127_5110_13_10: TcxTextEdit;
    cxMemo164: TcxMemo;
    cxMemo165: TcxMemo;
    cxMemo166: TcxMemo;
    cxMemo167: TcxMemo;
    cxMemo168: TcxMemo;
    cxMemo169: TcxMemo;
    cxMemo170: TcxMemo;
    cxMemo171: TcxMemo;
    cxMemo172: TcxMemo;
    cxMemo173: TcxMemo;
    e70_5112_8: TcxTextEdit;
    e80_5112_9: TcxTextEdit;
    e90_5112_10: TcxTextEdit;
    e100_5112_11: TcxTextEdit;
    e110_5112_12: TcxTextEdit;
    cxMemo174: TcxMemo;
    cxMemo175: TcxMemo;
    cxMemo176: TcxMemo;
    e60_5114_7_3: TcxTextEdit;
    e61_5114_7_4: TcxTextEdit;
    cxMemo177: TcxMemo;
    e70_5114_8_3: TcxTextEdit;
    e71_5114_8_4: TcxTextEdit;
    cxMemo178: TcxMemo;
    cxMemo179: TcxMemo;
    e01_5113_1_4: TcxTextEdit;
    e11_5113_2_4: TcxTextEdit;
    e21_5113_3_4: TcxTextEdit;
    e31_5113_4_4: TcxTextEdit;
    e41_5113_5_4: TcxTextEdit;
    e51_5113_6_4: TcxTextEdit;
    cxTextEdit12: TcxTextEdit;
    cxTextEdit13: TcxTextEdit;
    cxTextEdit14: TcxTextEdit;
    cxMemo66: TcxMemo;
    cxMemo67: TcxMemo;
    cxMemo68: TcxMemo;
    cxMemo69: TcxMemo;
    cxMemo70: TcxMemo;
    cxMemo141: TcxMemo;
    cxMemo148: TcxMemo;
    cxTextEdit3: TcxTextEdit;
    e131_5110_14_4: TcxTextEdit;
    e132_5110_14_5: TcxTextEdit;
    e133_5110_14_6: TcxTextEdit;
    e134_5110_14_7: TcxTextEdit;
    e135_5110_14_8: TcxTextEdit;
    e136_5110_14_9: TcxTextEdit;
    e137_5110_14_10: TcxTextEdit;
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure e10_5110_2_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e20_5110_3_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e30_5110_4_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e40_5110_5_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e10_5110_2_3MouseLeave(Sender: TObject);
    procedure e20_5110_3_3MouseLeave(Sender: TObject);
    procedure e30_5110_4_3MouseLeave(Sender: TObject);
    procedure e40_5110_5_3MouseLeave(Sender: TObject);
    procedure e50_5110_6_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e51_5110_6_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e52_5110_6_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e53_5110_6_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e54_5110_6_7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e55_5110_6_8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e56_5110_6_9MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e50_5110_6_3MouseLeave(Sender: TObject);
    procedure e51_5110_6_4MouseLeave(Sender: TObject);
    procedure e52_5110_6_5MouseLeave(Sender: TObject);
    procedure e53_5110_6_6MouseLeave(Sender: TObject);
    procedure e54_5110_6_7MouseLeave(Sender: TObject);
    procedure e55_5110_6_8MouseLeave(Sender: TObject);
    procedure e56_5110_6_9MouseLeave(Sender: TObject);
    procedure e60_5110_7_3MouseLeave(Sender: TObject);
    procedure e70_5110_8_3MouseLeave(Sender: TObject);
    procedure e80_5110_9_3MouseLeave(Sender: TObject);
    procedure e90_5110_10_3MouseLeave(Sender: TObject);
    procedure e60_5110_7_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e70_5110_8_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e80_5110_9_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e90_5110_10_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure aCalculateCellExecute(Sender: TObject);
    procedure aCalculateTableExecute(Sender: TObject);
    procedure aCalculateReportExecute(Sender: TObject);
    procedure odsKabBeforeOpen(DataSet: TDataSet);
    procedure bbSetPeriodClick(Sender: TObject);
    procedure aMetodicsExecute(Sender: TObject);
    procedure aDetailExecute(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure e101_5110_11_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e102_5110_11_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e102_5110_11_5MouseLeave(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    MedotradeSign : string;
    arrID : array of integer;
    sCompanyName, sOtdelName : String;
    pAPPSOTRID : Integer;
    pSOTRID : Integer;
    sVrachFIO : String;
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses fMetodics, fDetails, uPeriod;

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.aCalculateCellExecute(Sender: TObject);
begin
//
end;

procedure TfrmMain.aCalculateReportExecute(Sender: TObject);
begin
//
end;

procedure TfrmMain.aCalculateTableExecute(Sender: TObject);
begin
//
end;

procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.aDetailExecute(Sender: TObject);
begin
//
end;

procedure TfrmMain.aInfoExecute(Sender: TObject);
begin
//
end;

procedure TfrmMain.aMetodicsExecute(Sender: TObject);
begin
//
end;

procedure TfrmMain.bbSetPeriodClick(Sender: TObject);
begin
  with TfrmParamDate.Create(Self) do
    begin
      if Execute then
        begin
      if ModalResult = MrOK then
        begin
          cxDateBeg.Date := Period.First;
          cxDateEnd.Date := Period.Last; 
        end;
        end;
    Free;
  end;
end;

procedure TfrmMain.e101_5110_11_4MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  e101_5110_11_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e50_5110_6_3MouseLeave(Sender: TObject);
begin
e50_5110_6_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e50_5110_6_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e50_5110_6_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e51_5110_6_4MouseLeave(Sender: TObject);
begin
e51_5110_6_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e51_5110_6_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e51_5110_6_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e53_5110_6_6MouseLeave(Sender: TObject);
begin
e53_5110_6_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e53_5110_6_6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e53_5110_6_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e54_5110_6_7MouseLeave(Sender: TObject);
begin
e54_5110_6_7.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e54_5110_6_7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e54_5110_6_7.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e52_5110_6_5MouseLeave(Sender: TObject);
begin
e52_5110_6_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e52_5110_6_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e52_5110_6_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e55_5110_6_8MouseLeave(Sender: TObject);
begin
e55_5110_6_8.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e55_5110_6_8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e55_5110_6_8.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e56_5110_6_9MouseLeave(Sender: TObject);
begin
e56_5110_6_9.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e56_5110_6_9MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e56_5110_6_9.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e60_5110_7_3MouseLeave(Sender: TObject);
begin
e60_5110_7_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e60_5110_7_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e60_5110_7_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e70_5110_8_3MouseLeave(Sender: TObject);
begin
e70_5110_8_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e70_5110_8_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e70_5110_8_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e80_5110_9_3MouseLeave(Sender: TObject);
begin
e80_5110_9_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e80_5110_9_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e80_5110_9_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e90_5110_10_3MouseLeave(Sender: TObject);
begin
e90_5110_10_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e90_5110_10_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  e90_5110_10_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.DoShowForm;
var ods : TOracleDataSet;
    Ver : TJclFileVersionInfo;
begin
  cxPageControl1.ActivePageIndex := 0;
  pAPPSOTRID := StrToInt(paramstr(1));
  ods := TOracleDataSet.Create(nil);
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FK_SOTRID, ASU.DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, SYSDATE, '+#13+
                    '        ASU.PKG_SMINI.READSTRING (''CONFIG'', ''S_FULLNAME'', '''') AS COMPANYNAME, '+#13+
                    '        (SELECT FC_NAME '+#13+
                    '           FROM ASU.TOTDEL '+#13+
                    '          WHERE FK_ID = (SELECT FK_OTDID FROM ASU.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
                    '   FROM LOGIN.TAPPSOTR WHERE FL_DEL <> 1 AND FK_ID = :PFK_ID ';
    ods.DeclareAndSet('PFK_ID', otInteger, pAPPSOTRID);
    ods.Open;
    pSOTRID := ods.FieldByName('FK_SOTRID').AsInteger;
    sVrachFIO := ods.FieldByName('VRACHFIO').AsString;
    sCompanyName := ods.FieldByName('COMPANYNAME').AsString;
    sOtdelName := ods.FieldByName('OTDELNAME').AsString;
    cxDateBeg.Date := ods.FieldByName('SYSDATE').AsDateTime;
    cxDateEnd.Date := ods.FieldByName('SYSDATE').AsDateTime; //!!! +23:59:59
  finally
    ods.Free;
  end;
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  frmMain.Caption := 'Форма 30. Глава 5 - Настройка('+Ver.FileVersion+'). Пользователь: '+sVrachFIO;
  Ver.Free;
  if odsKab.Active = False then
    odsKab.Open;
  if odsSotr.Active = False then
    odsSotr.Open;

  MedotradeSign := ReadMedotradeSign;
end;

procedure TfrmMain.e102_5110_11_5MouseLeave(Sender: TObject);
begin
  TcxMemo(Sender).Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e102_5110_11_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  TcxMemo(Sender).Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e10_5110_2_3MouseLeave(Sender: TObject);
begin
e10_5110_2_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e10_5110_2_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e10_5110_2_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e20_5110_3_3MouseLeave(Sender: TObject);
begin
e20_5110_3_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e20_5110_3_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e20_5110_3_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e30_5110_4_3MouseLeave(Sender: TObject);
begin
e30_5110_4_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e30_5110_4_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e30_5110_4_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e40_5110_5_3MouseLeave(Sender: TObject);
begin
e40_5110_5_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e40_5110_5_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e40_5110_5_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
  Self.WindowState := wsMaximized;
end;

procedure TfrmMain.MenuItem1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmMetodics, frmMetodics);
  try
    frmMetodics.DoShowForm(Copy(pmMain_4longcaptions.PopupComponent.Name, 6, Length(pmMain_4longcaptions.PopupComponent.Name)-2),
                           cxPageControl1.ActivePage.Caption,
                           Copy(Copy(pmMain_4longcaptions.PopupComponent.Name, 6, Length(pmMain_4longcaptions.PopupComponent.Name)-2), 6, 2),
                           Copy(Copy(pmMain_4longcaptions.PopupComponent.Name, 6, Length(pmMain_4longcaptions.PopupComponent.Name)-2), 9, 1));
    frmMetodics.ShowModal;
  finally
    frmMetodics.Free;
  end;
end;

procedure TfrmMain.MenuItem2Click(Sender: TObject);
var ods : TOracleDataSet;
    memStream : TMemoryStream;
    str : TStringList;
    strSQL : String;
    strReptext : String;
begin
  Application.CreateForm(TfrmDetails, frmDetails);
  ods := TOracleDataSet.Create(nil);
  memStream := TMemoryStream.Create;
  str := TStringList.Create;
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FC_SQL '+
                    '   FROM STAT.T_MDS_SQL '+
                    '  WHERE FK_TABLES = (SELECT FK_ID '+
                    '                       FROM STAT.T_MDS_TABLES '+
                    '                      WHERE FK_FORMS = (SELECT FK_ID '+
                    '                                          FROM STAT.T_MDS_FORMS '+
                    '                                         WHERE FC_NAME = ''F30Glava5'') '+
                    '                        AND FC_NAME = :PFC_NAME) '+
                    '    AND FN_COLUMN = :PFN_COLUMN '+
                    '    AND FN_ROW = :PFN_ROW ';
    ods.DeclareAndSet('PFC_NAME', otString, cxPageControl1.ActivePage.Caption);
    ods.DeclareAndSet('PFN_COLUMN', otInteger, StrToInt(Copy(pmMain.PopupComponent.Name, 4, 1)));
    ods.DeclareAndSet('PFN_ROW', otInteger, StrToInt(Copy(pmMain.PopupComponent.Name, 2, 2)));
    ods.Open;
	  memStream.Position := 0;
	  TBlobField(ods.FieldByName('FC_SQL')).SaveToStream(memStream);
    memStream.Position := 0;
    str.LoadFromStream(memStream);
    strRepText := ' TNAZIS.FK_ID, '+
                  '        TNAZIS.FK_NAZSOSID, '+
                  '        TNAZIS.FK_SMID, '+
                  '        TNAZIS.FD_NAZ, '+
                  '        TNAZIS.FD_RUN, TO_CHAR(TNAZIS.FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_TIME, '+
                  '        (SELECT FC_NAME FROM TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABNAME, '+
                  '        ASU.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS ISSLNAME, '+
                  '        PKG_REGIST_PACFUNC.GET_PAC_FIO(TNAZIS.FK_PACID) FIOPAC, '+
                  '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA, '+
                  '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOUCHET'')) AS KOLVO, '+
                  '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOPRSV'')) AS KOLVOPRSV ';
    if pmMain.PopupComponent.Tag = 1 then
      begin
        str.Text := ' SELECT TNAZIS.FK_ID, '+
                    '        TNAZIS.FK_NAZSOSID, '+
                    '        TNAZIS.FK_SMID, '+
                    '        TNAZIS.FD_NAZ, '+
                    '        TNAZIS.FD_RUN, TO_CHAR(TNAZIS.FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_TIME, '+
                    '        (SELECT FC_NAME FROM TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABNAME, '+
                    '        ASU.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS ISSLNAME, '+
                    '        PKG_REGIST_PACFUNC.GET_PAC_FIO(TNAZIS.FK_PACID) FIOPAC, '+
                    '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA, '+
                    '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOUCHET'')) AS KOLVO, '+
                    '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOPRSV'')) AS KOLVOPRSV '+
                    '   FROM ASU.TNAZIS, ASU.TPODPISNAZ, (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''TARGET_DIAGNOSTIKA'') DG '+
                    '  WHERE TNAZIS.FK_ID = TPODPISNAZ.FK_NAZID '+
                    '    AND TPODPISNAZ.FK_SOS = ASU.GET_LABVIP '+
                    '    AND TNAZIS.FK_SMID IN '+
                    ' (SELECT FK_SMID '+
                    ' FROM ASU.TS_COLUMNNAZ '+
                    ' WHERE FK_OWNER IN '+
                    ' (SELECT FK_ID FROM ASU.TS_COLUMNNAZ WHERE FC_SYNONIM = '''+Copy(pmMain.PopupComponent.Name, 5, Length(pmMain.PopupComponent.Name)-2)+''')) '+
                    ' AND DG.FK_ID IN (SELECT FK_SMID FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID) '+
                    ' AND TNAZIS.FD_RUN >= :pdate1 '+
                    ' AND TNAZIS.FD_RUN <= :pdate2 '+
                    ' :ISPOLID '+
                    ' :KABID '+
                    ' :DEZID ';
      end;
    str.Text := StringReplace(str.Text, ':ISPOLID', ' ', [rfReplaceAll, rfIgnoreCase]);
    str.Text := StringReplace(str.Text, ':KABID', '', [rfReplaceAll, rfIgnoreCase]);
    str.Text := StringReplace(str.Text, ':DEZID', '', [rfReplaceAll, rfIgnoreCase]);
    str.Text := StringReplace(str.Text, 'COUNT(DISTINCT TNAZIS.FK_ID)', strRepText, [rfReplaceAll, rfIgnoreCase]);
    strSQL := str.Text;
  finally
    ods.Free;
    memStream.Free;
    str.Free;
  end;
  frmDetails.DoShowForm(strSQL,
                        cxDateBeg.Date,
                        cxDateEnd.Date);
  frmDetails.ShowModal;
  frmDetails.Free;


  Application.CreateForm(TfrmDetails, frmDetails);
  ods := TOracleDataSet.Create(nil);
  memStream := TMemoryStream.Create;
  str := TStringList.Create;
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FC_SQL '+
                    '   FROM STAT.T_MDS_SQL '+
                    '  WHERE FK_TABLES = (SELECT FK_ID '+
                    '                       FROM STAT.T_MDS_TABLES '+
                    '                      WHERE FK_FORMS = (SELECT FK_ID '+
                    '                                          FROM STAT.T_MDS_FORMS '+
                    '                                         WHERE FC_NAME = ''F30Glava5'') '+
                    '                        AND FC_NAME = :PFC_NAME) '+
                    '    AND FN_COLUMN = :PFN_COLUMN '+
                    '    AND FN_ROW = :PFN_ROW ';
    ods.DeclareAndSet('PFC_NAME', otString, cxPageControl1.ActivePage.Caption);
    ods.DeclareAndSet('PFN_COLUMN', otInteger, StrToInt(Copy(pmMain_4longcaptions.PopupComponent.Name, 4, 1)));
    ods.DeclareAndSet('PFN_ROW', otInteger, StrToInt(Copy(pmMain_4longcaptions.PopupComponent.Name, 2, 2)));
    ods.Open;
	  memStream.Position := 0;
	  TBlobField(ods.FieldByName('FC_SQL')).SaveToStream(memStream);
    memStream.Position := 0;
    str.LoadFromStream(memStream);
    strRepText := '*';
    str.Text := StringReplace(str.Text, ':ISPOLID', ' ', [rfReplaceAll, rfIgnoreCase]);
    str.Text := StringReplace(str.Text, ':KABID', '', [rfReplaceAll, rfIgnoreCase]);
    str.Text := StringReplace(str.Text, ':DEZID', '', [rfReplaceAll, rfIgnoreCase]);
    str.Text := StringReplace(str.Text, 'COUNT(DISTINCT TNAZIS.FK_ID)', strRepText, [rfReplaceAll, rfIgnoreCase]);
    strSQL := str.Text;
  finally
    ods.Free;
    memStream.Free;
    str.Free;
  end;
  frmDetails.DoShowForm(strSQL,
                        cxDateBeg.Date,
                        cxDateEnd.Date);
  frmDetails.ShowModal;
  frmDetails.Free;
end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmMetodics, frmMetodics);
  try
    if Length(pmMain.PopupComponent.Name) = 13 then
      begin
        frmMetodics.DoShowForm(Copy(pmMain.PopupComponent.Name, 5, Length(pmMain.PopupComponent.Name)-2),
                               cxPageControl1.ActivePage.Caption,
                               Copy(Copy(pmMain.PopupComponent.Name, 6, Length(pmMain.PopupComponent.Name)-2), 5, 2),
                               Copy(Copy(pmMain.PopupComponent.Name, 9, Length(pmMain.PopupComponent.Name)-2), 5, 1));
      end else
      begin
        frmMetodics.DoShowForm(Copy(pmMain.PopupComponent.Name, 5, Length(pmMain.PopupComponent.Name)-2),
                               cxPageControl1.ActivePage.Caption,
                               Copy(Copy(pmMain.PopupComponent.Name, 6, Length(pmMain.PopupComponent.Name)-2), 5, 1),
                               Copy(Copy(pmMain.PopupComponent.Name, 8, Length(pmMain.PopupComponent.Name)-2), 5, 1));
      end;
    frmMetodics.ShowModal;
  finally
    frmMetodics.Free;
  end;
end;

procedure TfrmMain.N2Click(Sender: TObject);
var ods : TOracleDataSet;
    memStream : TMemoryStream;
    str : TStringList;
    strSQL : String;
    strRepText : String;
begin
  Application.CreateForm(TfrmDetails, frmDetails);
  ods := TOracleDataSet.Create(nil);
  memStream := TMemoryStream.Create;
  str := TStringList.Create;
  try
    ods.Session := os;
    ods.Cursor := crSQLWait;
    ods.SQL.Text := ' SELECT FC_SQL '+
                    '   FROM STAT.T_MDS_SQL '+
                    '  WHERE FK_TABLES = (SELECT FK_ID '+
                    '                       FROM STAT.T_MDS_TABLES '+
                    '                      WHERE FK_FORMS = (SELECT FK_ID '+
                    '                                          FROM STAT.T_MDS_FORMS '+
                    '                                         WHERE FC_NAME = ''F30Glava5'') '+
                    '                        AND FC_NAME = :PFC_NAME) '+
                    '    AND FN_COLUMN = :PFN_COLUMN '+
                    '    AND FN_ROW = :PFN_ROW ';
    ods.DeclareAndSet('PFC_NAME', otString, cxPageControl1.ActivePage.Caption);
    ods.DeclareAndSet('PFN_COLUMN', otInteger, StrToInt(Copy(pmMain.PopupComponent.Name, 3, 1)));
    ods.DeclareAndSet('PFN_ROW', otInteger, StrToInt(Copy(pmMain.PopupComponent.Name, 2, 1)));
    ods.Open;
	  memStream.Position := 0;
	  TBlobField(ods.FieldByName('FC_SQL')).SaveToStream(memStream);
    memStream.Position := 0;
    str.LoadFromStream(memStream);
    strRepText := ' DISTINCT TNAZIS.FK_ID, '+
                  '        TNAZIS.FK_NAZSOSID, '+
                  '        TNAZIS.FK_SMID, '+
                  '        TNAZIS.FD_NAZ, '+
                  '        TNAZIS.FD_RUN, TO_CHAR(TNAZIS.FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_TIME, '+
                  '        (SELECT FC_NAME FROM TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABNAME, '+
                  '        ASU.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS ISSLNAME, '+
                  '        PKG_REGIST_PACFUNC.GET_PAC_FIO(TNAZIS.FK_PACID) FIOPAC, '+
                  '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA, '+
                  '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOUCHET'')) AS KOLVO, '+
                  '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOPRSV'')) AS KOLVOPRSV ';
    if pmMain.PopupComponent.Tag = 1 then
      begin
        str.Text := ' SELECT DISTINCT TNAZIS.FK_ID, '+
                    '        TNAZIS.FK_NAZSOSID, '+
                    '        TNAZIS.FK_SMID, '+
                    '        TNAZIS.FD_NAZ, '+
                    '        TNAZIS.FD_RUN, TO_CHAR(TNAZIS.FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_TIME, '+
                    '        (SELECT FC_NAME FROM TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABNAME, '+
                    '        ASU.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS ISSLNAME, '+
                    '        PKG_REGIST_PACFUNC.GET_PAC_FIO(TNAZIS.FK_PACID) FIOPAC, '+
                    '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA, '+
                    '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOUCHET'')) AS KOLVO, '+
                    '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOPRSV'')) AS KOLVOPRSV '+
                    '   FROM ASU.TNAZIS, ASU.TPODPISNAZ, (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''TARGET_DIAGNOSTIKA'') DG '+
                    '  WHERE TNAZIS.FK_ID = TPODPISNAZ.FK_NAZID '+
                    '    AND TPODPISNAZ.FK_SOS = ASU.GET_LABVIP '+
                    '    AND TNAZIS.FK_SMID IN '+
                    ' (SELECT FK_SMID '+
                    ' FROM ASU.TS_COLUMNNAZ '+
                    ' WHERE FK_OWNER IN '+
                    ' (SELECT FK_ID FROM ASU.TS_COLUMNNAZ WHERE FC_SYNONIM = '''+Copy(pmMain.PopupComponent.Name, 5, Length(pmMain.PopupComponent.Name)-2)+''')) '+
                    ' AND DG.FK_ID IN (SELECT FK_SMID FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID) '+
                    ' AND TNAZIS.FD_RUN >= :pdate1 '+
                    ' AND TNAZIS.FD_RUN <= :pdate2 '+
                    ' :ISPOLID '+
                    ' :KABID '+
                    ' :DEZID ';
      end;
    str.Text := StringReplace(str.Text, ':ISPOLID', ' ', [rfReplaceAll, rfIgnoreCase]);
    str.Text := StringReplace(str.Text, ':KABID', '', [rfReplaceAll, rfIgnoreCase]);
    str.Text := StringReplace(str.Text, ':DEZID', '', [rfReplaceAll, rfIgnoreCase]);
    str.Text := StringReplace(str.Text, 'COUNT(DISTINCT TNAZIS.FK_ID)', strRepText, [rfReplaceAll, rfIgnoreCase]);
    strSQL := str.Text;
  finally
    ods.Free;
    memStream.Free;
    str.Free;
  end;
  frmDetails.DoShowForm(strSQL,
                        cxDateBeg.Date,
                        cxDateEnd.Date);
  frmDetails.ShowModal;
  frmDetails.Free;
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
  Application.CreateForm(TfrmMetodics, frmMetodics);
  try
    if Length(pmSpec.PopupComponent.Name) = 13 then
      begin
        frmMetodics.DoShowForm(Copy(pmSpec.PopupComponent.Name, 5, Length(pmSpec.PopupComponent.Name)-2),
                               cxPageControl1.ActivePage.Caption,
                               Copy(pmSpec.PopupComponent.Name, 10, 1),
                               Copy(pmSpec.PopupComponent.Name, 12, 2));
      end;
    if Length(pmSpec.PopupComponent.Name) = 14 then
      begin
        frmMetodics.DoShowForm(Copy(pmSpec.PopupComponent.Name, 5, Length(pmSpec.PopupComponent.Name)-2),
                               cxPageControl1.ActivePage.Caption,
                               Copy(pmSpec.PopupComponent.Name, 10, 2),
                               Copy(pmSpec.PopupComponent.Name, 13, 2));
      end;
    if Length(pmSpec.PopupComponent.Name) = 15 then
      begin
        frmMetodics.DoShowForm(Copy(pmSpec.PopupComponent.Name, 6, Length(pmSpec.PopupComponent.Name)-2),
                               cxPageControl1.ActivePage.Caption,
                               Copy(pmSpec.PopupComponent.Name, 11, 2),
                               Copy(pmSpec.PopupComponent.Name, 14, 2));
      end;
    frmMetodics.ShowModal;
  finally
    frmMetodics.Free;
  end;
end;

procedure TfrmMain.N5Click(Sender: TObject);
begin
  Application.CreateForm(TfrmMetodics, frmMetodics);
  try
    frmMetodics.DoShowForm(Copy(pmSpecial4One.PopupComponent.Name, 5, Length(pmSpecial4One.PopupComponent.Name)-2),
                           cxPageControl1.ActivePage.Caption,
                           Copy(pmSpecial4One.PopupComponent.Name, 10, 2),
                           '');
    frmMetodics.ShowModal;
  finally
    frmMetodics.Free;
  end;
end;

procedure TfrmMain.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('PSOTR', pSOTRID);
end;

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
  Ver.Free;
end;

end.
