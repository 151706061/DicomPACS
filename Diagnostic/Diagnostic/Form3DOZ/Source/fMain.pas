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
  cxConstantsRus, dxBarCustomize_Rus;

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
    cxTS_1000: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    e00_1000_1_3: TcxTextEdit;
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
    cxMemo15: TcxMemo;
    cxMemo16: TcxMemo;
    cxMemo19: TcxMemo;
    cxMemo23: TcxMemo;
    cxMemo24: TcxMemo;
    cxMemo25: TcxMemo;
    cxMemo26: TcxMemo;
    cxMemo27: TcxMemo;
    cxMemo28: TcxMemo;
    cxMemo29: TcxMemo;
    cxMemo30: TcxMemo;
    e20_1000_3_3: TcxTextEdit;
    e30_1000_4_3: TcxTextEdit;
    e40_1000_5_3: TcxTextEdit;
    e60_1000_7_3: TcxTextEdit;
    e70_1000_8_3: TcxTextEdit;
    e80_1000_9_3: TcxTextEdit;
    e90_1000_10_3: TcxTextEdit;
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
    e01_1000_1_4: TcxTextEdit;
    e02_1000_1_5: TcxTextEdit;
    e03_1000_1_6: TcxTextEdit;
    e04_1000_1_7: TcxTextEdit;
    e05_1000_1_8: TcxTextEdit;
    e06_1000_1_9: TcxTextEdit;
    e11_1000_2_4: TcxTextEdit;
    e21_1000_3_4: TcxTextEdit;
    e31_1000_4_4: TcxTextEdit;
    e61_1000_7_4: TcxTextEdit;
    e71_1000_8_4: TcxTextEdit;
    e81_1000_9_4: TcxTextEdit;
    e41_1000_5_4: TcxTextEdit;
    e91_1000_10_4: TcxTextEdit;
    e12_1000_2_5: TcxTextEdit;
    e22_1000_3_5: TcxTextEdit;
    e32_1000_4_5: TcxTextEdit;
    e62_1000_7_5: TcxTextEdit;
    e72_1000_8_5: TcxTextEdit;
    e82_1000_9_5: TcxTextEdit;
    e92_1000_10_5: TcxTextEdit;
    e42_1000_5_5: TcxTextEdit;
    e13_1000_2_6: TcxTextEdit;
    e23_1000_3_6: TcxTextEdit;
    e33_1000_4_6: TcxTextEdit;
    e43_1000_5_6: TcxTextEdit;
    e13_1000_2_7: TcxTextEdit;
    e24_1000_3_7: TcxTextEdit;
    e34_1000_4_7: TcxTextEdit;
    e44_1000_5_7: TcxTextEdit;
    e63_1000_7_6: TcxTextEdit;
    e73_1000_8_6: TcxTextEdit;
    e83_1000_9_6: TcxTextEdit;
    e93_1000_10_6: TcxTextEdit;
    e64_1000_7_7: TcxTextEdit;
    e74_1000_8_7: TcxTextEdit;
    e84_1000_9_7: TcxTextEdit;
    e94_1000_10_7: TcxTextEdit;
    e15_1000_2_8: TcxTextEdit;
    e25_1000_3_8: TcxTextEdit;
    e35_1000_4_8: TcxTextEdit;
    e45_1000_5_8: TcxTextEdit;
    e16_1000_2_9: TcxTextEdit;
    e26_1000_3_9: TcxTextEdit;
    e36_1000_4_9: TcxTextEdit;
    e46_1000_5_9: TcxTextEdit;
    e65_1000_7_8: TcxTextEdit;
    e75_1000_8_8: TcxTextEdit;
    e85_1000_9_8: TcxTextEdit;
    e95_1000_10_8: TcxTextEdit;
    e66_1000_7_9: TcxTextEdit;
    e76_1000_8_9: TcxTextEdit;
    e86_1000_9_9: TcxTextEdit;
    e96_1000_10_9: TcxTextEdit;
    e50_1000_6_3: TcxTextEdit;
    e51_1000_6_4: TcxTextEdit;
    e53_1000_6_6: TcxTextEdit;
    e54_1000_6_7: TcxTextEdit;
    e52_1000_6_5: TcxTextEdit;
    e55_1000_6_8: TcxTextEdit;
    e56_1000_6_9: TcxTextEdit;
    e10_1000_2_3: TcxTextEdit;
    N3: TMenuItem;
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
    cxMemo14: TcxMemo;
    cxMemo135: TcxMemo;
    cxMemo136: TcxMemo;
    cxMemo137: TcxMemo;
    cxMemo138: TcxMemo;
    cxMemo139: TcxMemo;
    cxMemo140: TcxMemo;
    cxMemo141: TcxMemo;
    cxMemo142: TcxMemo;
    cxMemo143: TcxMemo;
    cxMemo144: TcxMemo;
    cxMemo17: TcxMemo;
    cxMemo18: TcxMemo;
    cxMemo20: TcxMemo;
    cxMemo21: TcxMemo;
    cxMemo22: TcxMemo;
    cxMemo145: TcxMemo;
    cxMemo146: TcxMemo;
    cxMemo147: TcxMemo;
    cxMemo148: TcxMemo;
    cxMemo149: TcxMemo;
    cxMemo150: TcxMemo;
    cxMemo151: TcxMemo;
    cxMemo152: TcxMemo;
    cxMemo153: TcxMemo;
    cxMemo154: TcxMemo;
    cxMemo155: TcxMemo;
    cxMemo156: TcxMemo;
    cxMemo157: TcxMemo;
    e07_1000_1_10: TcxTextEdit;
    e08_1000_1_11: TcxTextEdit;
    e100_1000_11_3: TcxTextEdit;
    e101_1000_11_4: TcxTextEdit;
    e102_1000_11_5: TcxTextEdit;
    e103_1000_11_6: TcxTextEdit;
    e104_1000_11_7: TcxTextEdit;
    e105_1000_11_8: TcxTextEdit;
    e106_1000_11_9: TcxTextEdit;
    e110_1000_12_3: TcxTextEdit;
    e111_1000_12_4: TcxTextEdit;
    e112_1000_12_5: TcxTextEdit;
    e113_1000_12_6: TcxTextEdit;
    e114_1000_12_7: TcxTextEdit;
    e115_1000_12_8: TcxTextEdit;
    e116_1000_12_9: TcxTextEdit;
    e120_1000_13_3: TcxTextEdit;
    e121_1000_13_4: TcxTextEdit;
    e122_1000_13_5: TcxTextEdit;
    e123_1000_13_6: TcxTextEdit;
    e124_1000_13_7: TcxTextEdit;
    e125_1000_13_8: TcxTextEdit;
    e126_1000_13_9: TcxTextEdit;
    e131_1000_14_4: TcxTextEdit;
    e132_1000_14_5: TcxTextEdit;
    e133_1000_14_6: TcxTextEdit;
    e134_1000_14_7: TcxTextEdit;
    e135_1000_14_8: TcxTextEdit;
    e136_1000_14_9: TcxTextEdit;
    cxTextEdit31: TcxTextEdit;
    cxTextEdit32: TcxTextEdit;
    e142_1000_15_5: TcxTextEdit;
    e143_1000_15_6: TcxTextEdit;
    cxTextEdit35: TcxTextEdit;
    cxTextEdit36: TcxTextEdit;
    cxTextEdit37: TcxTextEdit;
    cxTextEdit38: TcxTextEdit;
    cxTextEdit39: TcxTextEdit;
    e152_1000_16_5: TcxTextEdit;
    e153_1000_16_6: TcxTextEdit;
    cxTextEdit42: TcxTextEdit;
    cxTextEdit43: TcxTextEdit;
    cxTextEdit44: TcxTextEdit;
    e160_1000_17_3: TcxTextEdit;
    e161_1000_17_4: TcxTextEdit;
    e162_1000_17_5: TcxTextEdit;
    e163_1000_17_6: TcxTextEdit;
    e164_1000_17_7: TcxTextEdit;
    e165_1000_17_8: TcxTextEdit;
    e166_1000_17_9: TcxTextEdit;
    e170_1000_18_3: TcxTextEdit;
    e171_1000_18_4: TcxTextEdit;
    e172_1000_18_5: TcxTextEdit;
    e173_1000_18_6: TcxTextEdit;
    e174_1000_18_7: TcxTextEdit;
    e175_1000_18_8: TcxTextEdit;
    e176_1000_18_9: TcxTextEdit;
    e180_1000_19_3: TcxTextEdit;
    e181_1000_19_4: TcxTextEdit;
    e182_1000_19_5: TcxTextEdit;
    e183_1000_19_6: TcxTextEdit;
    e184_1000_19_7: TcxTextEdit;
    e185_1000_19_8: TcxTextEdit;
    e186_1000_19_9: TcxTextEdit;
    e17_1000_2_10: TcxTextEdit;
    e18_1000_2_11: TcxTextEdit;
    e27_1000_3_10: TcxTextEdit;
    e28_1000_3_11: TcxTextEdit;
    e37_1000_4_10: TcxTextEdit;
    e38_1000_4_11: TcxTextEdit;
    e47_1000_5_10: TcxTextEdit;
    e48_1000_5_11: TcxTextEdit;
    e57_1000_6_10: TcxTextEdit;
    e58_1000_6_11: TcxTextEdit;
    e67_1000_7_10: TcxTextEdit;
    e68_1000_7_11: TcxTextEdit;
    e77_1000_8_10: TcxTextEdit;
    e78_1000_8_11: TcxTextEdit;
    e87_1000_9_10: TcxTextEdit;
    e88_1000_9_11: TcxTextEdit;
    e97_1000_10_10: TcxTextEdit;
    e98_1000_10_11: TcxTextEdit;
    e107_1000_11_10: TcxTextEdit;
    e108_1000_11_11: TcxTextEdit;
    e117_1000_12_10: TcxTextEdit;
    e118_1000_12_11: TcxTextEdit;
    e127_1000_13_10: TcxTextEdit;
    e128_1000_13_11: TcxTextEdit;
    e137_1000_14_10: TcxTextEdit;
    e138_1000_14_11: TcxTextEdit;
    cxTextEdit92: TcxTextEdit;
    e148_1000_15_11: TcxTextEdit;
    cxTextEdit94: TcxTextEdit;
    e158_1000_16_11: TcxTextEdit;
    e167_1000_17_10: TcxTextEdit;
    e168_1000_17_11: TcxTextEdit;
    e177_1000_18_10: TcxTextEdit;
    e178_1000_18_11: TcxTextEdit;
    e187_1000_19_10: TcxTextEdit;
    e188_1000_19_11: TcxTextEdit;
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
    cxMemo158: TcxMemo;
    cxMemo159: TcxMemo;
    cxMemo160: TcxMemo;
    cxMemo161: TcxMemo;
    cxMemo162: TcxMemo;
    cxMemo163: TcxMemo;
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
    cxMemo174: TcxMemo;
    cxMemo175: TcxMemo;
    cxMemo176: TcxMemo;
    cxMemo177: TcxMemo;
    cxMemo178: TcxMemo;
    cxMemo179: TcxMemo;
    cxMemo180: TcxMemo;
    cxMemo181: TcxMemo;
    cxMemo182: TcxMemo;
    cxMemo183: TcxMemo;
    cxMemo184: TcxMemo;
    cxMemo185: TcxMemo;
    cxMemo186: TcxMemo;
    cxMemo187: TcxMemo;
    cxMemo188: TcxMemo;
    cxMemo189: TcxMemo;
    cxMemo190: TcxMemo;
    cxMemo192: TcxMemo;
    cxMemo193: TcxMemo;
    cxMemo194: TcxMemo;
    cxMemo195: TcxMemo;
    cxMemo196: TcxMemo;
    cxMemo197: TcxMemo;
    cxMemo198: TcxMemo;
    cxMemo199: TcxMemo;
    cxMemo200: TcxMemo;
    cxMemo201: TcxMemo;
    cxMemo202: TcxMemo;
    cxMemo203: TcxMemo;
    cxMemo204: TcxMemo;
    cxMemo205: TcxMemo;
    cxMemo206: TcxMemo;
    cxMemo207: TcxMemo;
    cxMemo208: TcxMemo;
    cxMemo209: TcxMemo;
    e00_1100_1_3: TcxTextEdit;
    e10_1100_2_3: TcxTextEdit;
    e20_1100_3_3: TcxTextEdit;
    e30_1100_4_3: TcxTextEdit;
    e40_1100_5_3: TcxTextEdit;
    e50_1100_6_3: TcxTextEdit;
    e60_1100_7_3: TcxTextEdit;
    e70_1100_8_3: TcxTextEdit;
    e80_1100_9_3: TcxTextEdit;
    e90_1100_10_3: TcxTextEdit;
    e100_1100_11_3: TcxTextEdit;
    e110_1100_12_3: TcxTextEdit;
    e120_1100_13_3: TcxTextEdit;
    e130_1100_14_3: TcxTextEdit;
    cxTextEdit116: TcxTextEdit;
    cxTextEdit117: TcxTextEdit;
    e160_1100_17_3: TcxTextEdit;
    e170_1100_18_3: TcxTextEdit;
    e01_1100_1_4: TcxTextEdit;
    e11_1100_2_4: TcxTextEdit;
    e21_1100_3_4: TcxTextEdit;
    e31_1100_4_4: TcxTextEdit;
    e41_1100_5_4: TcxTextEdit;
    e51_1100_6_4: TcxTextEdit;
    e61_1100_7_4: TcxTextEdit;
    e71_1100_8_4: TcxTextEdit;
    e81_1100_9_4: TcxTextEdit;
    e91_1100_10_4: TcxTextEdit;
    e101_1100_11_4: TcxTextEdit;
    e111_1100_12_4: TcxTextEdit;
    e121_1100_13_4: TcxTextEdit;
    e131_1100_14_4: TcxTextEdit;
    cxTextEdit135: TcxTextEdit;
    cxTextEdit136: TcxTextEdit;
    e161_1100_17_4: TcxTextEdit;
    e171_1100_18_4: TcxTextEdit;
    e02_1100_1_5: TcxTextEdit;
    e12_1100_2_5: TcxTextEdit;
    e22_1100_3_5: TcxTextEdit;
    e32_1100_4_5: TcxTextEdit;
    e42_1100_5_5: TcxTextEdit;
    e52_1100_6_5: TcxTextEdit;
    e62_1100_7_5: TcxTextEdit;
    e72_1100_8_5: TcxTextEdit;
    e82_1100_9_5: TcxTextEdit;
    e92_1100_10_5: TcxTextEdit;
    e102_1100_11_5: TcxTextEdit;
    e112_1100_12_5: TcxTextEdit;
    e122_1100_13_5: TcxTextEdit;
    e132_1100_14_5: TcxTextEdit;
    e142_1100_15_5: TcxTextEdit;
    e152_1100_16_5: TcxTextEdit;
    e162_1100_17_5: TcxTextEdit;
    e172_1100_18_5: TcxTextEdit;
    e03_1100_1_6: TcxTextEdit;
    e13_1100_2_6: TcxTextEdit;
    e23_1100_3_6: TcxTextEdit;
    e33_1100_4_6: TcxTextEdit;
    e43_1100_5_6: TcxTextEdit;
    e53_1100_6_6: TcxTextEdit;
    e63_1100_7_6: TcxTextEdit;
    e73_1100_8_6: TcxTextEdit;
    e83_1100_9_6: TcxTextEdit;
    e93_1100_10_6: TcxTextEdit;
    e103_1100_11_6: TcxTextEdit;
    e113_1100_12_6: TcxTextEdit;
    e123_1100_13_6: TcxTextEdit;
    e133_1100_14_6: TcxTextEdit;
    e143_1100_15_6: TcxTextEdit;
    e153_1100_16_6: TcxTextEdit;
    e163_1100_17_6: TcxTextEdit;
    e173_1100_18_6: TcxTextEdit;
    e04_1100_1_7: TcxTextEdit;
    cxTextEdit179: TcxTextEdit;
    e24_1100_3_7: TcxTextEdit;
    e34_1100_4_7: TcxTextEdit;
    e44_1100_5_7: TcxTextEdit;
    e54_1100_6_7: TcxTextEdit;
    e64_1100_7_7: TcxTextEdit;
    e74_1100_8_7: TcxTextEdit;
    e84_1100_9_7: TcxTextEdit;
    e94_1100_10_7: TcxTextEdit;
    e104_1100_11_7: TcxTextEdit;
    e114_1100_12_7: TcxTextEdit;
    e124_1100_13_7: TcxTextEdit;
    e134_1100_14_7: TcxTextEdit;
    cxTextEdit192: TcxTextEdit;
    cxTextEdit193: TcxTextEdit;
    e164_1100_17_7: TcxTextEdit;
    e174_1100_18_7: TcxTextEdit;
    e05_1100_1_8: TcxTextEdit;
    cxTextEdit198: TcxTextEdit;
    e25_1100_3_8: TcxTextEdit;
    e35_1100_4_8: TcxTextEdit;
    e45_1100_5_8: TcxTextEdit;
    e55_1100_6_8: TcxTextEdit;
    e65_1100_7_8: TcxTextEdit;
    e75_1100_8_8: TcxTextEdit;
    e85_1100_9_8: TcxTextEdit;
    e95_1100_10_8: TcxTextEdit;
    e105_1100_11_8: TcxTextEdit;
    e115_1100_12_8: TcxTextEdit;
    e125_1100_13_8: TcxTextEdit;
    e135_1100_14_8: TcxTextEdit;
    cxTextEdit211: TcxTextEdit;
    cxTextEdit212: TcxTextEdit;
    e165_1100_17_8: TcxTextEdit;
    e175_1100_18_8: TcxTextEdit;
    e06_1100_1_9: TcxTextEdit;
    cxTextEdit217: TcxTextEdit;
    e26_1100_3_9: TcxTextEdit;
    e36_1100_4_9: TcxTextEdit;
    e46_1100_5_9: TcxTextEdit;
    e56_1100_6_9: TcxTextEdit;
    e66_1100_7_9: TcxTextEdit;
    e86_1100_9_9: TcxTextEdit;
    e76_1100_8_9: TcxTextEdit;
    e96_1100_10_9: TcxTextEdit;
    e106_1100_11_9: TcxTextEdit;
    e116_1100_12_9: TcxTextEdit;
    e126_1100_13_9: TcxTextEdit;
    e136_1100_14_9: TcxTextEdit;
    cxTextEdit230: TcxTextEdit;
    cxTextEdit231: TcxTextEdit;
    e166_1100_17_9: TcxTextEdit;
    e176_1100_18_9: TcxTextEdit;
    e07_1100_1_10: TcxTextEdit;
    cxTextEdit236: TcxTextEdit;
    e27_1100_3_10: TcxTextEdit;
    e37_1100_4_10: TcxTextEdit;
    e47_1100_5_10: TcxTextEdit;
    e57_1100_6_10: TcxTextEdit;
    e67_1100_7_10: TcxTextEdit;
    e77_1100_8_10: TcxTextEdit;
    e87_1100_9_10: TcxTextEdit;
    e97_1100_10_10: TcxTextEdit;
    e107_1100_11_10: TcxTextEdit;
    e117_1100_12_10: TcxTextEdit;
    e127_1100_13_10: TcxTextEdit;
    e137_1100_14_10: TcxTextEdit;
    cxTextEdit249: TcxTextEdit;
    cxTextEdit250: TcxTextEdit;
    e167_1100_17_10: TcxTextEdit;
    e177_1100_18_10: TcxTextEdit;
    e08_1100_1_11: TcxTextEdit;
    e18_1100_2_11: TcxTextEdit;
    e28_1100_3_11: TcxTextEdit;
    e38_1100_4_11: TcxTextEdit;
    e48_1100_5_11: TcxTextEdit;
    e58_1100_6_11: TcxTextEdit;
    e68_1100_7_11: TcxTextEdit;
    e78_1100_8_11: TcxTextEdit;
    e88_1100_9_11: TcxTextEdit;
    e98_1100_10_11: TcxTextEdit;
    e108_1100_11_11: TcxTextEdit;
    e118_1100_12_11: TcxTextEdit;
    e128_1100_13_11: TcxTextEdit;
    e138_1100_14_11: TcxTextEdit;
    e148_1100_15_11: TcxTextEdit;
    e158_1100_16_11: TcxTextEdit;
    e168_1100_17_11: TcxTextEdit;
    e178_1100_18_11: TcxTextEdit;
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
    cxMemo211: TcxMemo;
    cxMemo212: TcxMemo;
    cxMemo213: TcxMemo;
    cxMemo214: TcxMemo;
    cxMemo215: TcxMemo;
    cxMemo216: TcxMemo;
    cxMemo217: TcxMemo;
    cxMemo218: TcxMemo;
    cxMemo219: TcxMemo;
    cxMemo220: TcxMemo;
    cxMemo221: TcxMemo;
    cxMemo222: TcxMemo;
    cxMemo223: TcxMemo;
    cxMemo224: TcxMemo;
    cxMemo225: TcxMemo;
    cxMemo226: TcxMemo;
    cxMemo227: TcxMemo;
    cxMemo228: TcxMemo;
    cxMemo229: TcxMemo;
    cxMemo230: TcxMemo;
    cxMemo231: TcxMemo;
    cxMemo232: TcxMemo;
    cxMemo233: TcxMemo;
    cxMemo234: TcxMemo;
    cxMemo235: TcxMemo;
    cxMemo236: TcxMemo;
    cxMemo237: TcxMemo;
    cxMemo238: TcxMemo;
    cxMemo239: TcxMemo;
    cxMemo240: TcxMemo;
    cxMemo241: TcxMemo;
    cxMemo242: TcxMemo;
    cxMemo243: TcxMemo;
    cxMemo244: TcxMemo;
    cxMemo245: TcxMemo;
    cxMemo246: TcxMemo;
    cxMemo247: TcxMemo;
    cxMemo248: TcxMemo;
    cxMemo249: TcxMemo;
    cxMemo250: TcxMemo;
    cxMemo251: TcxMemo;
    cxMemo252: TcxMemo;
    cxMemo253: TcxMemo;
    cxMemo254: TcxMemo;
    cxMemo255: TcxMemo;
    cxMemo256: TcxMemo;
    cxMemo257: TcxMemo;
    cxMemo258: TcxMemo;
    cxMemo259: TcxMemo;
    e00_2000_1_3: TcxTextEdit;
    e10_2000_2_3: TcxTextEdit;
    e20_2000_3_3: TcxTextEdit;
    e30_2000_4_3: TcxTextEdit;
    e40_2000_5_3: TcxTextEdit;
    e50_2000_6_3: TcxTextEdit;
    e60_2000_7_3: TcxTextEdit;
    e70_2000_8_3: TcxTextEdit;
    e80_2000_9_3: TcxTextEdit;
    e90_2000_10_3: TcxTextEdit;
    e100_2000_11_3: TcxTextEdit;
    e110_2000_12_3: TcxTextEdit;
    e120_2000_13_3: TcxTextEdit;
    e130_2000_14_3: TcxTextEdit;
    e140_2000_15_3: TcxTextEdit;
    e150_2000_16_3: TcxTextEdit;
    e160_2000_17_3: TcxTextEdit;
    e170_2000_18_3: TcxTextEdit;
    e180_2000_19_3: TcxTextEdit;
    e01_2000_1_4: TcxTextEdit;
    e11_2000_2_4: TcxTextEdit;
    e21_2000_3_4: TcxTextEdit;
    e31_2000_4_4: TcxTextEdit;
    e41_2000_5_4: TcxTextEdit;
    e51_2000_6_4: TcxTextEdit;
    e61_2000_7_4: TcxTextEdit;
    e71_2000_8_4: TcxTextEdit;
    e81_2000_9_4: TcxTextEdit;
    e91_2000_10_4: TcxTextEdit;
    e101_2000_11_4: TcxTextEdit;
    e111_2000_12_4: TcxTextEdit;
    e121_2000_13_4: TcxTextEdit;
    e131_2000_14_4: TcxTextEdit;
    cxTextEdit306: TcxTextEdit;
    cxTextEdit307: TcxTextEdit;
    e161_2000_17_4: TcxTextEdit;
    e171_2000_18_4: TcxTextEdit;
    e181_2000_19_4: TcxTextEdit;
    e02_2000_1_5: TcxTextEdit;
    e12_2000_2_5: TcxTextEdit;
    e22_2000_3_5: TcxTextEdit;
    e32_2000_4_5: TcxTextEdit;
    e42_2000_5_5: TcxTextEdit;
    e52_2000_6_5: TcxTextEdit;
    e62_2000_7_5: TcxTextEdit;
    e72_2000_8_5: TcxTextEdit;
    e82_2000_9_5: TcxTextEdit;
    e92_2000_10_5: TcxTextEdit;
    e102_2000_11_5: TcxTextEdit;
    e112_2000_12_5: TcxTextEdit;
    e122_2000_13_5: TcxTextEdit;
    e132_2000_14_5: TcxTextEdit;
    e142_2000_15_5: TcxTextEdit;
    e152_2000_16_5: TcxTextEdit;
    e162_2000_17_5: TcxTextEdit;
    e172_2000_18_5: TcxTextEdit;
    e182_2000_19_5: TcxTextEdit;
    e03_2000_1_6: TcxTextEdit;
    e13_2000_2_6: TcxTextEdit;
    e23_2000_3_6: TcxTextEdit;
    e33_2000_4_6: TcxTextEdit;
    e43_2000_5_6: TcxTextEdit;
    e53_2000_6_6: TcxTextEdit;
    e63_2000_7_6: TcxTextEdit;
    e73_2000_8_6: TcxTextEdit;
    e83_2000_9_6: TcxTextEdit;
    e93_2000_10_6: TcxTextEdit;
    e103_2000_11_6: TcxTextEdit;
    e113_2000_12_6: TcxTextEdit;
    e123_2000_13_6: TcxTextEdit;
    e133_2000_14_6: TcxTextEdit;
    e143_2000_15_6: TcxTextEdit;
    e153_2000_16_6: TcxTextEdit;
    e163_2000_17_6: TcxTextEdit;
    e173_2000_18_6: TcxTextEdit;
    e183_2000_19_6: TcxTextEdit;
    e04_2000_1_7: TcxTextEdit;
    cxTextEdit350: TcxTextEdit;
    e24_2000_3_7: TcxTextEdit;
    e34_2000_4_7: TcxTextEdit;
    e44_2000_5_7: TcxTextEdit;
    e54_2000_6_7: TcxTextEdit;
    e64_2000_7_7: TcxTextEdit;
    e74_2000_8_7: TcxTextEdit;
    e84_2000_9_7: TcxTextEdit;
    e94_2000_10_7: TcxTextEdit;
    e104_2000_11_7: TcxTextEdit;
    e114_2000_12_7: TcxTextEdit;
    e124_2000_13_7: TcxTextEdit;
    e134_2000_14_7: TcxTextEdit;
    cxTextEdit363: TcxTextEdit;
    cxTextEdit364: TcxTextEdit;
    e164_2000_17_7: TcxTextEdit;
    e174_2000_18_7: TcxTextEdit;
    e184_2000_19_7: TcxTextEdit;
    e05_2000_1_8: TcxTextEdit;
    cxTextEdit369: TcxTextEdit;
    e25_2000_3_8: TcxTextEdit;
    e35_2000_4_8: TcxTextEdit;
    e45_2000_5_8: TcxTextEdit;
    e55_2000_6_8: TcxTextEdit;
    e65_2000_7_8: TcxTextEdit;
    e75_2000_8_8: TcxTextEdit;
    e85_2000_9_8: TcxTextEdit;
    e95_2000_10_8: TcxTextEdit;
    e105_2000_11_8: TcxTextEdit;
    e115_2000_12_8: TcxTextEdit;
    e125_2000_13_8: TcxTextEdit;
    e135_2000_14_8: TcxTextEdit;
    cxTextEdit382: TcxTextEdit;
    cxTextEdit383: TcxTextEdit;
    e165_2000_17_8: TcxTextEdit;
    e175_2000_18_8: TcxTextEdit;
    e185_2000_19_8: TcxTextEdit;
    e06_2000_1_9: TcxTextEdit;
    cxTextEdit388: TcxTextEdit;
    e26_2000_3_9: TcxTextEdit;
    e36_2000_4_9: TcxTextEdit;
    e46_2000_5_9: TcxTextEdit;
    e56_2000_6_9: TcxTextEdit;
    e66_2000_7_9: TcxTextEdit;
    e86_2000_9_9: TcxTextEdit;
    e76_2000_8_9: TcxTextEdit;
    e96_2000_10_9: TcxTextEdit;
    e106_2000_11_9: TcxTextEdit;
    e116_2000_12_9: TcxTextEdit;
    e126_2000_13_9: TcxTextEdit;
    e136_2000_14_9: TcxTextEdit;
    cxTextEdit401: TcxTextEdit;
    cxTextEdit402: TcxTextEdit;
    e166_2000_17_9: TcxTextEdit;
    e176_2000_18_9: TcxTextEdit;
    e186_2000_19_9: TcxTextEdit;
    e07_2000_1_10: TcxTextEdit;
    cxTextEdit407: TcxTextEdit;
    e27_2000_3_10: TcxTextEdit;
    e37_2000_4_10: TcxTextEdit;
    e47_2000_5_10: TcxTextEdit;
    e57_2000_6_10: TcxTextEdit;
    e67_2000_7_10: TcxTextEdit;
    e77_2000_8_10: TcxTextEdit;
    e87_2000_9_10: TcxTextEdit;
    e97_2000_10_10: TcxTextEdit;
    e107_2000_11_10: TcxTextEdit;
    e117_2000_12_10: TcxTextEdit;
    e127_2000_13_10: TcxTextEdit;
    e137_2000_14_10: TcxTextEdit;
    cxTextEdit420: TcxTextEdit;
    cxTextEdit421: TcxTextEdit;
    e167_2000_17_10: TcxTextEdit;
    e177_2000_18_10: TcxTextEdit;
    e187_2000_19_10: TcxTextEdit;
    e08_2000_1_11: TcxTextEdit;
    e18_2000_2_11: TcxTextEdit;
    e28_2000_3_11: TcxTextEdit;
    e38_2000_4_11: TcxTextEdit;
    e48_2000_5_11: TcxTextEdit;
    e58_2000_6_11: TcxTextEdit;
    e68_2000_7_11: TcxTextEdit;
    e78_2000_8_11: TcxTextEdit;
    e88_2000_9_11: TcxTextEdit;
    e98_2000_10_11: TcxTextEdit;
    e108_2000_11_11: TcxTextEdit;
    e118_2000_12_11: TcxTextEdit;
    e128_2000_13_11: TcxTextEdit;
    e138_2000_14_11: TcxTextEdit;
    e148_2000_15_11: TcxTextEdit;
    e158_2000_16_11: TcxTextEdit;
    e168_2000_17_11: TcxTextEdit;
    e178_2000_18_11: TcxTextEdit;
    e188_2000_19_11: TcxTextEdit;
    cxMemo65: TcxMemo;
    cxMemo66: TcxMemo;
    cxMemo67: TcxMemo;
    cxMemo68: TcxMemo;
    cxMemo69: TcxMemo;
    cxMemo70: TcxMemo;
    cxMemo71: TcxMemo;
    cxMemo72: TcxMemo;
    cxMemo73: TcxMemo;
    cxMemo74: TcxMemo;
    cxMemo75: TcxMemo;
    cxMemo76: TcxMemo;
    cxMemo260: TcxMemo;
    cxMemo261: TcxMemo;
    cxMemo262: TcxMemo;
    cxMemo263: TcxMemo;
    cxMemo264: TcxMemo;
    cxMemo265: TcxMemo;
    cxMemo266: TcxMemo;
    cxMemo267: TcxMemo;
    cxMemo268: TcxMemo;
    cxMemo269: TcxMemo;
    cxMemo270: TcxMemo;
    cxMemo271: TcxMemo;
    cxMemo272: TcxMemo;
    cxMemo273: TcxMemo;
    cxMemo274: TcxMemo;
    cxMemo275: TcxMemo;
    cxMemo276: TcxMemo;
    cxMemo277: TcxMemo;
    cxMemo278: TcxMemo;
    cxMemo279: TcxMemo;
    cxMemo280: TcxMemo;
    cxMemo281: TcxMemo;
    cxMemo282: TcxMemo;
    cxMemo283: TcxMemo;
    cxMemo284: TcxMemo;
    cxMemo285: TcxMemo;
    cxMemo286: TcxMemo;
    cxMemo287: TcxMemo;
    cxMemo288: TcxMemo;
    cxMemo289: TcxMemo;
    cxMemo290: TcxMemo;
    cxMemo292: TcxMemo;
    cxMemo293: TcxMemo;
    cxMemo294: TcxMemo;
    cxMemo295: TcxMemo;
    cxMemo296: TcxMemo;
    cxMemo297: TcxMemo;
    cxMemo298: TcxMemo;
    cxMemo299: TcxMemo;
    cxMemo300: TcxMemo;
    cxMemo301: TcxMemo;
    cxMemo302: TcxMemo;
    cxMemo303: TcxMemo;
    cxMemo304: TcxMemo;
    cxMemo305: TcxMemo;
    cxMemo306: TcxMemo;
    cxMemo307: TcxMemo;
    cxMemo308: TcxMemo;
    cxMemo309: TcxMemo;
    e00_2100_1_3: TcxTextEdit;
    e10_2100_2_3: TcxTextEdit;
    e20_2100_3_3: TcxTextEdit;
    e30_2100_4_3: TcxTextEdit;
    e40_2100_5_3: TcxTextEdit;
    e50_2100_6_3: TcxTextEdit;
    e60_2100_7_3: TcxTextEdit;
    e70_2100_8_3: TcxTextEdit;
    e80_2100_9_3: TcxTextEdit;
    e90_2100_10_3: TcxTextEdit;
    e100_2100_11_3: TcxTextEdit;
    e110_2100_12_3: TcxTextEdit;
    e120_2100_13_3: TcxTextEdit;
    e130_2100_14_3: TcxTextEdit;
    e140_2100_15_3: TcxTextEdit;
    e150_2100_16_3: TcxTextEdit;
    e160_2100_17_3: TcxTextEdit;
    e170_2100_18_3: TcxTextEdit;
    e01_2100_1_4: TcxTextEdit;
    e11_2100_2_4: TcxTextEdit;
    e21_2100_3_4: TcxTextEdit;
    e31_2100_4_4: TcxTextEdit;
    e41_2100_5_4: TcxTextEdit;
    e51_2100_6_4: TcxTextEdit;
    e61_2100_7_4: TcxTextEdit;
    e71_2100_8_4: TcxTextEdit;
    e81_2100_9_4: TcxTextEdit;
    e91_2100_10_4: TcxTextEdit;
    e101_2100_11_4: TcxTextEdit;
    e111_2100_12_4: TcxTextEdit;
    e121_2100_13_4: TcxTextEdit;
    e131_2100_14_4: TcxTextEdit;
    cxTextEdit477: TcxTextEdit;
    cxTextEdit478: TcxTextEdit;
    e161_2100_17_4: TcxTextEdit;
    e171_2100_18_4: TcxTextEdit;
    e02_2100_1_5: TcxTextEdit;
    e12_2100_2_5: TcxTextEdit;
    e22_2100_3_5: TcxTextEdit;
    e32_2100_4_5: TcxTextEdit;
    e42_2100_5_5: TcxTextEdit;
    e52_2100_6_5: TcxTextEdit;
    e62_2100_7_5: TcxTextEdit;
    e72_2100_8_5: TcxTextEdit;
    e82_2100_9_5: TcxTextEdit;
    e92_2100_10_5: TcxTextEdit;
    e102_2100_11_5: TcxTextEdit;
    e112_2100_12_5: TcxTextEdit;
    e122_2100_13_5: TcxTextEdit;
    e132_2100_14_5: TcxTextEdit;
    e142_2100_15_5: TcxTextEdit;
    e152_2100_16_5: TcxTextEdit;
    e162_2100_17_5: TcxTextEdit;
    e172_2100_18_5: TcxTextEdit;
    e03_2100_1_6: TcxTextEdit;
    e13_2100_2_6: TcxTextEdit;
    e23_2100_3_6: TcxTextEdit;
    e33_2100_4_6: TcxTextEdit;
    e43_2100_5_6: TcxTextEdit;
    e53_2100_6_6: TcxTextEdit;
    e63_2100_7_6: TcxTextEdit;
    e73_2100_8_6: TcxTextEdit;
    e83_2100_9_6: TcxTextEdit;
    e93_2100_10_6: TcxTextEdit;
    e103_2100_11_6: TcxTextEdit;
    e113_2100_12_6: TcxTextEdit;
    e123_2100_13_6: TcxTextEdit;
    e133_2100_14_6: TcxTextEdit;
    e143_2100_15_6: TcxTextEdit;
    e153_2100_16_6: TcxTextEdit;
    e163_2100_17_6: TcxTextEdit;
    e173_2100_18_6: TcxTextEdit;
    e04_2100_1_7: TcxTextEdit;
    cxTextEdit521: TcxTextEdit;
    e24_2100_3_7: TcxTextEdit;
    e34_2100_4_7: TcxTextEdit;
    e44_2100_5_7: TcxTextEdit;
    e54_2100_6_7: TcxTextEdit;
    e64_2100_7_7: TcxTextEdit;
    e74_2100_8_7: TcxTextEdit;
    e84_2100_9_7: TcxTextEdit;
    e94_2100_10_7: TcxTextEdit;
    e104_2100_11_7: TcxTextEdit;
    e114_2100_12_7: TcxTextEdit;
    e124_2100_13_7: TcxTextEdit;
    e134_2100_14_7: TcxTextEdit;
    cxTextEdit534: TcxTextEdit;
    cxTextEdit535: TcxTextEdit;
    e164_2100_17_7: TcxTextEdit;
    e174_2100_18_7: TcxTextEdit;
    e05_2100_1_8: TcxTextEdit;
    cxTextEdit540: TcxTextEdit;
    e25_2100_3_8: TcxTextEdit;
    e35_2100_4_8: TcxTextEdit;
    e45_2100_5_8: TcxTextEdit;
    e55_2100_6_8: TcxTextEdit;
    e65_2100_7_8: TcxTextEdit;
    e75_2100_8_8: TcxTextEdit;
    e85_2100_9_8: TcxTextEdit;
    e95_2100_10_8: TcxTextEdit;
    e105_2100_11_8: TcxTextEdit;
    e115_2100_12_8: TcxTextEdit;
    e125_2100_13_8: TcxTextEdit;
    e135_2100_14_8: TcxTextEdit;
    cxTextEdit553: TcxTextEdit;
    cxTextEdit554: TcxTextEdit;
    e165_2100_17_8: TcxTextEdit;
    e175_2100_18_8: TcxTextEdit;
    e06_2100_1_9: TcxTextEdit;
    cxTextEdit559: TcxTextEdit;
    e26_2100_3_9: TcxTextEdit;
    e36_2100_4_9: TcxTextEdit;
    e46_2100_5_9: TcxTextEdit;
    e56_2100_6_9: TcxTextEdit;
    e66_2100_7_9: TcxTextEdit;
    e86_2100_9_9: TcxTextEdit;
    e76_2100_8_9: TcxTextEdit;
    e96_2100_10_9: TcxTextEdit;
    e106_2100_11_9: TcxTextEdit;
    e116_2100_12_9: TcxTextEdit;
    e126_2100_13_9: TcxTextEdit;
    e136_2100_14_9: TcxTextEdit;
    cxTextEdit572: TcxTextEdit;
    cxTextEdit573: TcxTextEdit;
    e166_2100_17_9: TcxTextEdit;
    e176_2100_18_9: TcxTextEdit;
    e07_2100_1_10: TcxTextEdit;
    cxTextEdit578: TcxTextEdit;
    e27_2100_3_10: TcxTextEdit;
    e37_2100_4_10: TcxTextEdit;
    e47_2100_5_10: TcxTextEdit;
    e57_2100_6_10: TcxTextEdit;
    e67_2100_7_10: TcxTextEdit;
    e77_2100_8_10: TcxTextEdit;
    e87_2100_9_10: TcxTextEdit;
    e97_2100_10_10: TcxTextEdit;
    e107_2100_11_10: TcxTextEdit;
    e117_2100_12_10: TcxTextEdit;
    e127_2100_13_10: TcxTextEdit;
    e137_2100_14_10: TcxTextEdit;
    cxTextEdit591: TcxTextEdit;
    cxTextEdit592: TcxTextEdit;
    e167_2100_17_10: TcxTextEdit;
    e177_2100_18_10: TcxTextEdit;
    e08_2100_1_11: TcxTextEdit;
    e14_2100_2_7: TcxTextEdit;
    e28_2100_3_11: TcxTextEdit;
    e37_2100_4_11: TcxTextEdit;
    e48_2100_5_11: TcxTextEdit;
    e58_2100_6_11: TcxTextEdit;
    e68_2100_7_11: TcxTextEdit;
    e78_2100_8_11: TcxTextEdit;
    e88_2100_9_11: TcxTextEdit;
    e98_2100_10_11: TcxTextEdit;
    e108_2100_11_11: TcxTextEdit;
    e118_2100_12_11: TcxTextEdit;
    e128_2100_13_11: TcxTextEdit;
    e138_2100_14_11: TcxTextEdit;
    e148_2100_15_11: TcxTextEdit;
    e158_2100_16_11: TcxTextEdit;
    e168_2100_17_11: TcxTextEdit;
    e178_2100_18_11: TcxTextEdit;
    cxMemo311: TcxMemo;
    cxMemo312: TcxMemo;
    e09_1100_1_12: TcxTextEdit;
    e19_1100_2_12: TcxTextEdit;
    e29_1100_3_12: TcxTextEdit;
    e39_1100_4_12: TcxTextEdit;
    e49_1100_5_12: TcxTextEdit;
    e59_1100_6_12: TcxTextEdit;
    e69_1100_7_12: TcxTextEdit;
    e79_1100_8_12: TcxTextEdit;
    e89_1100_9_12: TcxTextEdit;
    e99_1100_10_12: TcxTextEdit;
    e109_1100_11_12: TcxTextEdit;
    e119_1100_12_12: TcxTextEdit;
    e129_1100_13_12: TcxTextEdit;
    e139_1100_14_12: TcxTextEdit;
    e149_1100_15_12: TcxTextEdit;
    e159_1100_16_12: TcxTextEdit;
    e169_1100_17_12: TcxTextEdit;
    e179_1100_18_12: TcxTextEdit;
    cxMemo191: TcxMemo;
    cxMemo210: TcxMemo;
    e09_2100_1_12: TcxTextEdit;
    e15_2100_2_8: TcxTextEdit;
    e29_2100_3_12: TcxTextEdit;
    e38_2100_4_12: TcxTextEdit;
    e49_2100_5_12: TcxTextEdit;
    e59_2100_6_12: TcxTextEdit;
    e69_2100_7_12: TcxTextEdit;
    e79_2100_8_12: TcxTextEdit;
    e89_2100_9_12: TcxTextEdit;
    e99_2100_10_12: TcxTextEdit;
    e109_2100_11_12: TcxTextEdit;
    e119_2100_12_12: TcxTextEdit;
    e129_2100_13_12: TcxTextEdit;
    e139_2100_14_12: TcxTextEdit;
    e149_2100_15_12: TcxTextEdit;
    e159_2100_16_12: TcxTextEdit;
    e169_2100_17_12: TcxTextEdit;
    e179_2100_18_12: TcxTextEdit;
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
    cxMemo91: TcxMemo;
    cxMemo92: TcxMemo;
    cxMemo93: TcxMemo;
    cxMemo94: TcxMemo;
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
    cxMemo95: TcxMemo;
    cxMemo96: TcxMemo;
    cxMemo97: TcxMemo;
    e00_3000_1_3: TcxTextEdit;
    e10_3000_2_3: TcxTextEdit;
    e20_3000_3_3: TcxTextEdit;
    e30_3000_4_3: TcxTextEdit;
    e40_3000_5_3: TcxTextEdit;
    e50_3000_6_3: TcxTextEdit;
    e60_3000_7_3: TcxTextEdit;
    e70_3000_8_3: TcxTextEdit;
    e01_3000_1_4: TcxTextEdit;
    e11_3000_2_4: TcxTextEdit;
    e21_3000_3_4: TcxTextEdit;
    e31_3000_4_4: TcxTextEdit;
    e41_3000_5_4: TcxTextEdit;
    e51_3000_6_4: TcxTextEdit;
    e61_3000_7_4: TcxTextEdit;
    e71_3000_8_4: TcxTextEdit;
    e02_3000_1_5: TcxTextEdit;
    e12_3000_2_5: TcxTextEdit;
    e22_3000_3_5: TcxTextEdit;
    e32_3000_4_5: TcxTextEdit;
    e42_3000_5_5: TcxTextEdit;
    e52_3000_6_5: TcxTextEdit;
    e62_3000_7_5: TcxTextEdit;
    e72_3000_8_5: TcxTextEdit;
    e80_3000_9_3: TcxTextEdit;
    e81_3000_9_4: TcxTextEdit;
    e82_3000_9_5: TcxTextEdit;
    e90_3000_10_3: TcxTextEdit;
    e91_3000_10_4: TcxTextEdit;
    e92_3000_10_5: TcxTextEdit;
    e03_3000_1_6: TcxTextEdit;
    e13_3000_2_6: TcxTextEdit;
    e33_3000_4_6: TcxTextEdit;
    e23_3000_3_6: TcxTextEdit;
    e63_3000_7_6: TcxTextEdit;
    e73_3000_8_6: TcxTextEdit;
    e53_3000_6_6: TcxTextEdit;
    e43_3000_5_6: TcxTextEdit;
    e83_3000_9_6: TcxTextEdit;
    e93_3000_10_6: TcxTextEdit;
    e04_3000_1_7: TcxTextEdit;
    e05_3000_1_8: TcxTextEdit;
    e14_3000_2_7: TcxTextEdit;
    e15_3000_2_8: TcxTextEdit;
    e16_3000_2_9: TcxTextEdit;
    e24_3000_3_7: TcxTextEdit;
    e25_3000_3_8: TcxTextEdit;
    e26_3000_3_9: TcxTextEdit;
    e06_3000_1_9: TcxTextEdit;
    e34_3000_4_7: TcxTextEdit;
    e35_3000_4_8: TcxTextEdit;
    e36_3000_4_9: TcxTextEdit;
    e44_3000_5_7: TcxTextEdit;
    e45_3000_5_8: TcxTextEdit;
    e46_3000_5_9: TcxTextEdit;
    e54_3000_6_7: TcxTextEdit;
    e55_3000_6_8: TcxTextEdit;
    e56_3000_6_9: TcxTextEdit;
    e64_3000_7_7: TcxTextEdit;
    e65_3000_7_8: TcxTextEdit;
    e66_3000_7_9: TcxTextEdit;
    e74_3000_8_7: TcxTextEdit;
    e75_3000_8_8: TcxTextEdit;
    e76_3000_8_9: TcxTextEdit;
    e84_3000_9_7: TcxTextEdit;
    e85_3000_9_8: TcxTextEdit;
    e86_3000_9_9: TcxTextEdit;
    e94_3000_10_7: TcxTextEdit;
    e95_3000_10_8: TcxTextEdit;
    e96_3000_10_9: TcxTextEdit;
    e07_3000_1_10: TcxTextEdit;
    e08_3000_1_11: TcxTextEdit;
    e17_3000_2_10: TcxTextEdit;
    e18_3000_2_11: TcxTextEdit;
    e37_3000_4_10: TcxTextEdit;
    e27_3000_3_10: TcxTextEdit;
    e28_3000_3_11: TcxTextEdit;
    e38_3000_4_11: TcxTextEdit;
    e47_3000_5_10: TcxTextEdit;
    e48_3000_5_11: TcxTextEdit;
    e57_3000_6_10: TcxTextEdit;
    e58_3000_6_11: TcxTextEdit;
    e67_3000_7_10: TcxTextEdit;
    e68_3000_7_11: TcxTextEdit;
    e77_3000_8_10: TcxTextEdit;
    e78_3000_8_11: TcxTextEdit;
    e97_3000_10_10: TcxTextEdit;
    e98_3000_10_11: TcxTextEdit;
    e87_3000_9_10: TcxTextEdit;
    e88_3000_9_11: TcxTextEdit;
    e130_1000_14_3: TcxTextEdit;
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure aCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
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
    procedure CellMouseLeave(Sender: TObject);
    procedure CellMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    MedotradeSign : string;
    sCompanyName, sOtdelName : String;
    pAPPSOTRID : Integer;
    pSOTRID : Integer;
    sVrachFIO : String;
    arrID : array of integer;
    procedure DoShowForm;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses fMetodics, uPeriod; //fDetails;

{$R *.dfm}

{ TfrmMain }

//------------------------------------------------------------------------------
procedure TfrmMain.aCalculateCellExecute(Sender: TObject);
begin
//
end;

//------------------------------------------------------------------------------
procedure TfrmMain.aCalculateReportExecute(Sender: TObject);
begin
//
end;

//------------------------------------------------------------------------------
procedure TfrmMain.aCalculateTableExecute(Sender: TObject);
begin
//
end;

//------------------------------------------------------------------------------
procedure TfrmMain.aCloseExecute(Sender: TObject);
begin
  close;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.aDetailExecute(Sender: TObject);
begin
//
end;

//------------------------------------------------------------------------------
procedure TfrmMain.aInfoExecute(Sender: TObject);
begin
//
end;

//------------------------------------------------------------------------------
procedure TfrmMain.aMetodicsExecute(Sender: TObject);
begin
//
end;

//------------------------------------------------------------------------------
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

//------------------------------------------------------------------------------
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
                    '           FROM asu.TOTDEL '+#13+
                    '          WHERE FK_ID = (SELECT FK_OTDID FROM asu.TSOTR WHERE FK_ID = TAPPSOTR.FK_SOTRID)) AS OTDELNAME '+#13+
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
  frmMain.Caption := 'Форма 3ДОЗ - Настройка('+Ver.FileVersion+'). Пользователь: '+sVrachFIO;
  Ver.Free;
  if odsKab.Active = False then
    odsKab.Open;
  if odsSotr.Active = False then
    odsSotr.Open;
  MedotradeSign := ReadMedotradeSign;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Вы хотите выйти из приложения ?', 'Вопрос', MB_YESNO + MB_ICONQUESTION) = MrYes then
    action := caFree
  else
    action := caNone;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GetSession(os, 'ASU');
end;

//------------------------------------------------------------------------------
procedure TfrmMain.MenuItem1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmMetodics, frmMetodics);
  try
    if Length(pmMain_4longcaptions.PopupComponent.Name) = 13 then
      begin
        frmMetodics.DoShowForm(Copy(pmMain_4longcaptions.PopupComponent.Name, 5, Length(pmMain_4longcaptions.PopupComponent.Name)-2),
                               cxPageControl1.ActivePage.Caption,
                               copy(pmMain_4longcaptions.PopupComponent.Name, 10, 1),
                               copy(pmMain_4longcaptions.PopupComponent.Name, 12, 2));
        frmMetodics.ShowModal;
      end;
    if Length(pmMain_4longcaptions.PopupComponent.Name) = 14 then
      begin
        frmMetodics.DoShowForm(Copy(pmMain_4longcaptions.PopupComponent.Name, 5, Length(pmMain_4longcaptions.PopupComponent.Name)-2),
                               cxPageControl1.ActivePage.Caption,
                               copy(pmMain_4longcaptions.PopupComponent.Name, 10, 2),
                               copy(pmMain_4longcaptions.PopupComponent.Name, 13, 2));
        frmMetodics.ShowModal;
      end;
  finally
    frmMetodics.Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.MenuItem2Click(Sender: TObject);
//var ods : TOracleDataSet;
//    memStream : TMemoryStream;
//    str : TStringList;
//    strSQL : String;
//    strReptext : String;
begin
//  Application.CreateForm(TfrmDetails, frmDetails);
//  ods := TOracleDataSet.Create(nil);
//  memStream := TMemoryStream.Create;
//  str := TStringList.Create;
//  try
//    ods.Session := os;
//    ods.Cursor := crSQLWait;
//    ods.SQL.Text := ' SELECT FC_SQL '+
//                    '   FROM STAT.T_MDS_SQL '+
//                    '  WHERE FK_TABLES = (SELECT FK_ID '+
//                    '                       FROM STAT.T_MDS_TABLES '+
//                    '                      WHERE FK_FORMS = (SELECT FK_ID '+
//                    '                                          FROM STAT.T_MDS_FORMS '+
//                    '                                         WHERE FC_NAME = ''F30Glava5'') '+
//                    '                        AND FC_NAME = :PFC_NAME) '+
//                    '    AND FN_COLUMN = :PFN_COLUMN '+
//                    '    AND FN_ROW = :PFN_ROW ';
//    ods.DeclareAndSet('PFC_NAME', otString, cxPageControl1.ActivePage.Caption);
//    ods.DeclareAndSet('PFN_COLUMN', otInteger, StrToInt(Copy(pmMain.PopupComponent.Name, 4, 1)));
//    ods.DeclareAndSet('PFN_ROW', otInteger, StrToInt(Copy(pmMain.PopupComponent.Name, 2, 2)));
//    ods.Open;
//	  memStream.Position := 0;
//	  TBlobField(ods.FieldByName('FC_SQL')).SaveToStream(memStream);
//    memStream.Position := 0;
//    str.LoadFromStream(memStream);
//    strRepText := ' TNAZIS.FK_ID, '+
//                  '        TNAZIS.FK_NAZSOSID, '+
//                  '        TNAZIS.FK_SMID, '+
//                  '        TNAZIS.FD_NAZ, '+
//                  '        TNAZIS.FD_RUN, TO_CHAR(TNAZIS.FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_TIME, '+
//                  '        (SELECT FC_NAME FROM TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABNAME, '+
//                  '        ASU.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS ISSLNAME, '+
//                  '        PKG_REGIST_PACFUNC.GET_PAC_FIO(TNAZIS.FK_PACID) FIOPAC, '+
//                  '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA, '+
//                  '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOUCHET'')) AS KOLVO, '+
//                  '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOPRSV'')) AS KOLVOPRSV ';
//    if pmMain.PopupComponent.Tag = 1 then
//      begin
//        str.Text := ' SELECT TNAZIS.FK_ID, '+
//                    '        TNAZIS.FK_NAZSOSID, '+
//                    '        TNAZIS.FK_SMID, '+
//                    '        TNAZIS.FD_NAZ, '+
//                    '        TNAZIS.FD_RUN, TO_CHAR(TNAZIS.FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_TIME, '+
//                    '        (SELECT FC_NAME FROM TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABNAME, '+
//                    '        ASU.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS ISSLNAME, '+
//                    '        PKG_REGIST_PACFUNC.GET_PAC_FIO(TNAZIS.FK_PACID) FIOPAC, '+
//                    '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA, '+
//                    '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOUCHET'')) AS KOLVO, '+
//                    '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOPRSV'')) AS KOLVOPRSV '+
//                    '   FROM ASU.TNAZIS, ASU.TPODPISNAZ, (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''TARGET_DIAGNOSTIKA'') DG '+
//                    '  WHERE TNAZIS.FK_ID = TPODPISNAZ.FK_NAZID '+
//                    '    AND TPODPISNAZ.FK_SOS = ASU.GET_LABVIP '+
//                    '    AND TNAZIS.FK_SMID IN '+
//                    ' (SELECT FK_SMID '+
//                    ' FROM ASU.TS_COLUMNNAZ '+
//                    ' WHERE FK_OWNER IN '+
//                    ' (SELECT FK_ID FROM ASU.TS_COLUMNNAZ WHERE FC_SYNONIM = '''+Copy(pmMain.PopupComponent.Name, 5, Length(pmMain.PopupComponent.Name)-2)+''')) '+
//                    ' AND DG.FK_ID IN (SELECT FK_SMID FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID) '+
//                    ' AND TNAZIS.FD_RUN >= :pdate1 '+
//                    ' AND TNAZIS.FD_RUN <= :pdate2 '+
//                    ' :ISPOLID '+
//                    ' :KABID '+
//                    ' :DEZID ';
//      end;
//    str.Text := StringReplace(str.Text, ':ISPOLID', ' ', [rfReplaceAll, rfIgnoreCase]);
//    str.Text := StringReplace(str.Text, ':KABID', '', [rfReplaceAll, rfIgnoreCase]);
//    str.Text := StringReplace(str.Text, ':DEZID', '', [rfReplaceAll, rfIgnoreCase]);
//    str.Text := StringReplace(str.Text, 'COUNT(DISTINCT TNAZIS.FK_ID)', strRepText, [rfReplaceAll, rfIgnoreCase]);
//    strSQL := str.Text;
//  finally
//    ods.Free;
//    memStream.Free;
//    str.Free;
//  end;
//  frmDetails.DoShowForm(strSQL,
//                        cxDateBeg.Date,
//                        cxDateEnd.Date);
//  frmDetails.ShowModal;
//  frmDetails.Free;
//
//
//  Application.CreateForm(TfrmDetails, frmDetails);
//  ods := TOracleDataSet.Create(nil);
//  memStream := TMemoryStream.Create;
//  str := TStringList.Create;
//  try
//    ods.Session := os;
//    ods.Cursor := crSQLWait;
//    ods.SQL.Text := ' SELECT FC_SQL '+
//                    '   FROM STAT.T_MDS_SQL '+
//                    '  WHERE FK_TABLES = (SELECT FK_ID '+
//                    '                       FROM STAT.T_MDS_TABLES '+
//                    '                      WHERE FK_FORMS = (SELECT FK_ID '+
//                    '                                          FROM STAT.T_MDS_FORMS '+
//                    '                                         WHERE FC_NAME = ''F30Glava5'') '+
//                    '                        AND FC_NAME = :PFC_NAME) '+
//                    '    AND FN_COLUMN = :PFN_COLUMN '+
//                    '    AND FN_ROW = :PFN_ROW ';
//    ods.DeclareAndSet('PFC_NAME', otString, cxPageControl1.ActivePage.Caption);
//    ods.DeclareAndSet('PFN_COLUMN', otInteger, StrToInt(Copy(pmMain_4longcaptions.PopupComponent.Name, 4, 1)));
//    ods.DeclareAndSet('PFN_ROW', otInteger, StrToInt(Copy(pmMain_4longcaptions.PopupComponent.Name, 2, 2)));
//    ods.Open;
//	  memStream.Position := 0;
//	  TBlobField(ods.FieldByName('FC_SQL')).SaveToStream(memStream);
//    memStream.Position := 0;
//    str.LoadFromStream(memStream);
//    strRepText := '*';
//    str.Text := StringReplace(str.Text, ':ISPOLID', ' ', [rfReplaceAll, rfIgnoreCase]);
//    str.Text := StringReplace(str.Text, ':KABID', '', [rfReplaceAll, rfIgnoreCase]);
//    str.Text := StringReplace(str.Text, ':DEZID', '', [rfReplaceAll, rfIgnoreCase]);
//    str.Text := StringReplace(str.Text, 'COUNT(DISTINCT TNAZIS.FK_ID)', strRepText, [rfReplaceAll, rfIgnoreCase]);
//    strSQL := str.Text;
//  finally
//    ods.Free;
//    memStream.Free;
//    str.Free;
//  end;
//  frmDetails.DoShowForm(strSQL,
//                        cxDateBeg.Date,
//                        cxDateEnd.Date);
//  frmDetails.ShowModal;
//  frmDetails.Free;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.N1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmMetodics, frmMetodics);
  try
    if Length(pmMain.PopupComponent.Name) = 13 then
      begin
        frmMetodics.DoShowForm(Copy(pmMain.PopupComponent.Name, 5, Length(pmMain.PopupComponent.Name)-2),  //synonim
                               cxPageControl1.ActivePage.Caption, //tablename
                               Copy(Copy(pmMain.PopupComponent.Name, 6, Length(pmMain.PopupComponent.Name)-2), 5, 2), //row
                               Copy(Copy(pmMain.PopupComponent.Name, 9, Length(pmMain.PopupComponent.Name)-2), 5, 1)); //column
      end else
      begin
        if Length(pmMain.PopupComponent.Name) = 14 then
          begin
            frmMetodics.DoShowForm(Copy(pmMain.PopupComponent.Name, 6, Length(pmMain.PopupComponent.Name)-2),
                                   cxPageControl1.ActivePage.Caption,
                                   copy(pmMain.PopupComponent.Name, 11, 2),
                                   copy(pmMain.PopupComponent.Name, 14, 1));
          end else
          begin
            if Length(pmMain.PopupComponent.Name) = 15 then
              begin
                frmMetodics.DoShowForm(Copy(pmMain.PopupComponent.Name, 6, Length(pmMain.PopupComponent.Name)-2),
                                       cxPageControl1.ActivePage.Caption,
                                       copy(pmMain.PopupComponent.Name, 11, 2),
                                       copy(pmMain.PopupComponent.Name, 14, 2));
              end else
              begin
                frmMetodics.DoShowForm(Copy(pmMain.PopupComponent.Name, 5, Length(pmMain.PopupComponent.Name)-2),
                                       cxPageControl1.ActivePage.Caption,
                                       copy(pmMain.PopupComponent.Name, 10, 1),
                                       copy(pmMain.PopupComponent.Name, 12, 1));
              end;
          end;

      end;

    frmMetodics.ShowModal;
  finally
    frmMetodics.Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.N2Click(Sender: TObject);
//var ods : TOracleDataSet;
//    memStream : TMemoryStream;
//    str : TStringList;
//    strSQL : String;
//    strRepText : String;
begin
//  Application.CreateForm(TfrmDetails, frmDetails);
//  ods := TOracleDataSet.Create(nil);
//  memStream := TMemoryStream.Create;
//  str := TStringList.Create;
//  try
//    ods.Session := os;
//    ods.Cursor := crSQLWait;
//    ods.SQL.Text := ' SELECT FC_SQL '+
//                    '   FROM STAT.T_MDS_SQL '+
//                    '  WHERE FK_TABLES = (SELECT FK_ID '+
//                    '                       FROM STAT.T_MDS_TABLES '+
//                    '                      WHERE FK_FORMS = (SELECT FK_ID '+
//                    '                                          FROM STAT.T_MDS_FORMS '+
//                    '                                         WHERE FC_NAME = ''F30Glava5'') '+
//                    '                        AND FC_NAME = :PFC_NAME) '+
//                    '    AND FN_COLUMN = :PFN_COLUMN '+
//                    '    AND FN_ROW = :PFN_ROW ';
//    ods.DeclareAndSet('PFC_NAME', otString, cxPageControl1.ActivePage.Caption);
//    ods.DeclareAndSet('PFN_COLUMN', otInteger, StrToInt(Copy(pmMain.PopupComponent.Name, 3, 1)));
//    ods.DeclareAndSet('PFN_ROW', otInteger, StrToInt(Copy(pmMain.PopupComponent.Name, 2, 1)));
//    ods.Open;
//	  memStream.Position := 0;
//	  TBlobField(ods.FieldByName('FC_SQL')).SaveToStream(memStream);
//    memStream.Position := 0;
//    str.LoadFromStream(memStream);
//    strRepText := ' DISTINCT TNAZIS.FK_ID, '+
//                  '        TNAZIS.FK_NAZSOSID, '+
//                  '        TNAZIS.FK_SMID, '+
//                  '        TNAZIS.FD_NAZ, '+
//                  '        TNAZIS.FD_RUN, TO_CHAR(TNAZIS.FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_TIME, '+
//                  '        (SELECT FC_NAME FROM TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABNAME, '+
//                  '        ASU.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS ISSLNAME, '+
//                  '        PKG_REGIST_PACFUNC.GET_PAC_FIO(TNAZIS.FK_PACID) FIOPAC, '+
//                  '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA, '+
//                  '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOUCHET'')) AS KOLVO, '+
//                  '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOPRSV'')) AS KOLVOPRSV ';
//    if pmMain.PopupComponent.Tag = 1 then
//      begin
//        str.Text := ' SELECT DISTINCT TNAZIS.FK_ID, '+
//                    '        TNAZIS.FK_NAZSOSID, '+
//                    '        TNAZIS.FK_SMID, '+
//                    '        TNAZIS.FD_NAZ, '+
//                    '        TNAZIS.FD_RUN, TO_CHAR(TNAZIS.FD_RUN, ''DD.MM.YYYY HH24:MI'') AS FD_RUN_TIME, '+
//                    '        (SELECT FC_NAME FROM TKABINET WHERE FK_ID = TNAZIS.FK_ROOMID) AS KABNAME, '+
//                    '        ASU.GET_NAME_RGISSL(TNAZIS.FK_SMID) AS ISSLNAME, '+
//                    '        PKG_REGIST_PACFUNC.GET_PAC_FIO(TNAZIS.FK_PACID) FIOPAC, '+
//                    '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID = -1 AND FK_SMEDITID = -1) AS DOZA, '+
//                    '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOUCHET'')) AS KOLVO, '+
//                    '        (SELECT FN_NUM FROM TIB WHERE FK_PACID = TNAZIS.FK_ID AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''XRAY_KOLVOPRSV'')) AS KOLVOPRSV '+
//                    '   FROM ASU.TNAZIS, ASU.TPODPISNAZ, (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = ''TARGET_DIAGNOSTIKA'') DG '+
//                    '  WHERE TNAZIS.FK_ID = TPODPISNAZ.FK_NAZID '+
//                    '    AND TPODPISNAZ.FK_SOS = ASU.GET_LABVIP '+
//                    '    AND TNAZIS.FK_SMID IN '+
//                    ' (SELECT FK_SMID '+
//                    ' FROM ASU.TS_COLUMNNAZ '+
//                    ' WHERE FK_OWNER IN '+
//                    ' (SELECT FK_ID FROM ASU.TS_COLUMNNAZ WHERE FC_SYNONIM = '''+Copy(pmMain.PopupComponent.Name, 5, Length(pmMain.PopupComponent.Name)-2)+''')) '+
//                    ' AND DG.FK_ID IN (SELECT FK_SMID FROM ASU.TIB WHERE FK_PACID = TNAZIS.FK_ID) '+
//                    ' AND TNAZIS.FD_RUN >= :pdate1 '+
//                    ' AND TNAZIS.FD_RUN <= :pdate2 '+
//                    ' :ISPOLID '+
//                    ' :KABID '+
//                    ' :DEZID ';
//      end;
//    str.Text := StringReplace(str.Text, ':ISPOLID', ' ', [rfReplaceAll, rfIgnoreCase]);
//    str.Text := StringReplace(str.Text, ':KABID', '', [rfReplaceAll, rfIgnoreCase]);
//    str.Text := StringReplace(str.Text, ':DEZID', '', [rfReplaceAll, rfIgnoreCase]);
//    str.Text := StringReplace(str.Text, 'COUNT(DISTINCT TNAZIS.FK_ID)', strRepText, [rfReplaceAll, rfIgnoreCase]);
//    strSQL := str.Text;
//  finally
//    ods.Free;
//    memStream.Free;
//    str.Free;
//  end;
//  frmDetails.DoShowForm(strSQL,
//                        cxDateBeg.Date,
//                        cxDateEnd.Date);
//  frmDetails.ShowModal;
//  frmDetails.Free;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.odsKabBeforeOpen(DataSet: TDataSet);
begin
  odsKab.SetVariable('PSOTR', pSOTRID);
end;

//------------------------------------------------------------------------------
procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
  Ver.Free;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.CellMouseLeave(Sender: TObject);
begin
  if (Sender is TcxTextEdit) then begin
     (Sender as TcxTextEdit).Style.BorderStyle := ebsUltraFlat;
  end;
end;

//------------------------------------------------------------------------------
procedure TfrmMain.CellMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if (Sender is TcxTextEdit) then begin
     (Sender as TcxTextEdit).Style.BorderStyle := ebsThick;
  end;
end;

end.
