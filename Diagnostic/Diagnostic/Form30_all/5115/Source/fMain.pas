unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JclFileUtils, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, dxBar, Oracle, ImgList, ActnList, OracleData, cxClasses,
  dxSkinscxPCPainter, cxPC, cxControls, cxContainer, cxEdit, cxTextEdit, Menus,
  cxMemo, DB, cxSplitter, ExtCtrls, cxGroupBox, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxGraphics,
  cxCheckBox, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, SMMainAPI, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmMain = class(TForm)
    AL: TActionList;
    IL: TImageList;
    os: TOracleSession;
    cxPageControl1: TcxPageControl;
    cxTS_5110: TcxTabSheet;
    e00_5115_1_3: TcxTextEdit;
    pmMain: TPopupMenu;
    N1: TMenuItem;
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
    cxMemo19: TcxMemo;
    cxMemo20: TcxMemo;
    cxMemo21: TcxMemo;
    cxMemo22: TcxMemo;
    cxMemo23: TcxMemo;
    cxMemo24: TcxMemo;
    cxMemo25: TcxMemo;
    cxMemo26: TcxMemo;
    cxMemo27: TcxMemo;
    e20_5115_3_3: TcxTextEdit;
    e30_5115_4_3: TcxTextEdit;
    e40_5115_5_3: TcxTextEdit;
    e60_5115_7_3: TcxTextEdit;
    e70_5115_8_3: TcxTextEdit;
    e80_5115_9_3: TcxTextEdit;
    e90_5115_10_3: TcxTextEdit;
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
    e01_5115_1_4: TcxTextEdit;
    e02_5115_1_5: TcxTextEdit;
    e03_5115_1_6: TcxTextEdit;
    e11_5115_2_4: TcxTextEdit;
    e21_5115_3_4: TcxTextEdit;
    e31_5115_4_4: TcxTextEdit;
    e61_5115_7_4: TcxTextEdit;
    e71_5115_8_4: TcxTextEdit;
    e81_5115_9_4: TcxTextEdit;
    e41_5115_5_4: TcxTextEdit;
    e91_5115_10_4: TcxTextEdit;
    e12_5115_2_5: TcxTextEdit;
    e22_5115_3_5: TcxTextEdit;
    e32_5115_4_5: TcxTextEdit;
    e62_5115_7_5: TcxTextEdit;
    e72_5115_8_5: TcxTextEdit;
    e82_5115_9_5: TcxTextEdit;
    e92_5115_10_5: TcxTextEdit;
    e42_5115_5_5: TcxTextEdit;
    e13_5115_2_6: TcxTextEdit;
    e23_5115_3_6: TcxTextEdit;
    e33_5115_4_6: TcxTextEdit;
    e43_5115_5_6: TcxTextEdit;
    e63_5115_7_6: TcxTextEdit;
    e73_5115_8_6: TcxTextEdit;
    e83_5115_9_6: TcxTextEdit;
    e93_5115_10_6: TcxTextEdit;
    e50_5115_6_3: TcxTextEdit;
    e51_5115_6_4: TcxTextEdit;
    e53_5115_6_6: TcxTextEdit;
    e52_5115_6_5: TcxTextEdit;
    e10_5115_2_3: TcxTextEdit;
    aMetodics: TAction;
    pmMain_4longcaptions: TPopupMenu;
    MenuItem1: TMenuItem;
    cxMemo16: TcxMemo;
    cxMemo17: TcxMemo;
    e100_5115_11_3: TcxTextEdit;
    e100_5115_11_4: TcxTextEdit;
    e100_5115_11_5: TcxTextEdit;
    e100_5115_11_6: TcxTextEdit;
    cxMemo18: TcxMemo;
    cxMemo28: TcxMemo;
    e110_5115_12_3: TcxTextEdit;
    e110_5115_12_4: TcxTextEdit;
    e110_5115_12_5: TcxTextEdit;
    e110_5115_12_6: TcxTextEdit;
    cxMemo45: TcxMemo;
    cxMemo46: TcxMemo;
    e150_5115_16_3: TcxTextEdit;
    e150_5115_16_4: TcxTextEdit;
    e150_5115_16_5: TcxTextEdit;
    e150_5115_16_6: TcxTextEdit;
    cxMemo57: TcxMemo;
    cxMemo58: TcxMemo;
    e210_5115_22_3: TcxTextEdit;
    e210_5115_22_4: TcxTextEdit;
    e210_5115_22_5: TcxTextEdit;
    e210_5115_22_6: TcxTextEdit;
    cxMemo59: TcxMemo;
    cxMemo60: TcxMemo;
    e220_5115_23_3: TcxTextEdit;
    e220_5115_23_4: TcxTextEdit;
    e220_5115_23_5: TcxTextEdit;
    e220_5115_23_6: TcxTextEdit;
    cxTabSheet1: TcxTabSheet;
    cxMemo29: TcxMemo;
    cxMemo30: TcxMemo;
    e120_5115_13_3: TcxTextEdit;
    e120_5115_13_4: TcxTextEdit;
    e120_5115_13_5: TcxTextEdit;
    e120_5115_13_6: TcxTextEdit;
    cxMemo41: TcxMemo;
    cxMemo42: TcxMemo;
    e130_5115_14_3: TcxTextEdit;
    e130_5115_14_4: TcxTextEdit;
    e130_5115_14_5: TcxTextEdit;
    e130_5115_14_6: TcxTextEdit;
    cxMemo43: TcxMemo;
    cxMemo44: TcxMemo;
    e140_5115_15_3: TcxTextEdit;
    e140_5115_15_4: TcxTextEdit;
    e140_5115_15_5: TcxTextEdit;
    e140_5115_15_6: TcxTextEdit;
    cxMemo47: TcxMemo;
    cxMemo48: TcxMemo;
    e160_5115_17_3: TcxTextEdit;
    e160_5115_17_4: TcxTextEdit;
    e160_5115_17_5: TcxTextEdit;
    e160_5115_17_6: TcxTextEdit;
    cxMemo49: TcxMemo;
    cxMemo50: TcxMemo;
    e170_5115_18_3: TcxTextEdit;
    e170_5115_18_4: TcxTextEdit;
    e170_5115_18_5: TcxTextEdit;
    e170_5115_18_6: TcxTextEdit;
    cxMemo51: TcxMemo;
    cxMemo52: TcxMemo;
    e180_5115_19_3: TcxTextEdit;
    e180_5115_19_4: TcxTextEdit;
    e180_5115_19_5: TcxTextEdit;
    e180_5115_19_6: TcxTextEdit;
    cxMemo53: TcxMemo;
    cxMemo54: TcxMemo;
    e190_5115_20_3: TcxTextEdit;
    e190_5115_20_4: TcxTextEdit;
    e190_5115_20_5: TcxTextEdit;
    e190_5115_20_6: TcxTextEdit;
    cxMemo55: TcxMemo;
    cxMemo56: TcxMemo;
    e200_5115_21_3: TcxTextEdit;
    e200_5115_21_4: TcxTextEdit;
    e200_5115_21_5: TcxTextEdit;
    e200_5115_21_6: TcxTextEdit;
    cxMemo61: TcxMemo;
    cxMemo62: TcxMemo;
    e230_5115_24_3: TcxTextEdit;
    e230_5115_24_4: TcxTextEdit;
    e230_5115_24_5: TcxTextEdit;
    e230_5115_24_6: TcxTextEdit;
    cxMemo63: TcxMemo;
    cxMemo64: TcxMemo;
    e240_5115_25_3: TcxTextEdit;
    e240_5115_25_4: TcxTextEdit;
    e240_5115_25_5: TcxTextEdit;
    e240_5115_25_6: TcxTextEdit;
    cxMemo65: TcxMemo;
    e00_5116_1_1: TcxTextEdit;
    cxTabSheet2: TcxTabSheet;
    cxMemo66: TcxMemo;
    cxMemo67: TcxMemo;
    cxMemo68: TcxMemo;
    cxMemo69: TcxMemo;
    cxMemo70: TcxMemo;
    cxMemo71: TcxMemo;
    cxMemo72: TcxMemo;
    cxMemo73: TcxMemo;
    e00_5125_1_3: TcxTextEdit;
    cxMemo74: TcxMemo;
    cxMemo75: TcxMemo;
    cxMemo76: TcxMemo;
    e01_5125_1_4: TcxTextEdit;
    cxMemo77: TcxMemo;
    cxMemo79: TcxMemo;
    e02_5125_1_5: TcxTextEdit;
    cxMemo81: TcxMemo;
    e03_5125_1_6: TcxTextEdit;
    cxMemo82: TcxMemo;
    cxMemo83: TcxMemo;
    cxMemo84: TcxMemo;
    cxMemo85: TcxMemo;
    cxMemo86: TcxMemo;
    e04_5125_1_7: TcxTextEdit;
    e05_5125_1_8: TcxTextEdit;
    cxMemo88: TcxMemo;
    cxMemo89: TcxMemo;
    cxMemo90: TcxMemo;
    cxMemo91: TcxMemo;
    e10_5125_2_3: TcxTextEdit;
    e20_5125_3_3: TcxTextEdit;
    e11_5125_2_4: TcxTextEdit;
    e12_5125_2_5: TcxTextEdit;
    e13_5125_2_6: TcxTextEdit;
    e14_5125_2_7: TcxTextEdit;
    e15_5125_2_8: TcxTextEdit;
    e21_5125_3_4: TcxTextEdit;
    e22_5125_3_5: TcxTextEdit;
    e23_5125_3_6: TcxTextEdit;
    e24_5125_3_7: TcxTextEdit;
    e25_5125_3_8: TcxTextEdit;
    cxTabSheet3: TcxTabSheet;
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
    e00_5300_1_3: TcxTextEdit;
    e01_5300_1_4: TcxTextEdit;
    e02_5300_1_5: TcxTextEdit;
    e03_5300_1_6: TcxTextEdit;
    e04_5300_1_7: TcxTextEdit;
    e05_5300_1_8: TcxTextEdit;
    e06_5300_1_9: TcxTextEdit;
    e10_5300_2_3: TcxTextEdit;
    e11_5300_2_4: TcxTextEdit;
    e12_5300_2_5: TcxTextEdit;
    e13_5300_2_6: TcxTextEdit;
    e14_5300_2_7: TcxTextEdit;
    e15_5300_2_8: TcxTextEdit;
    e16_5300_2_9: TcxTextEdit;
    cxTabSheet4: TcxTabSheet;
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
    cxMemo129: TcxMemo;
    cxMemo130: TcxMemo;
    cxMemo131: TcxMemo;
    cxMemo132: TcxMemo;
    cxMemo133: TcxMemo;
    cxMemo134: TcxMemo;
    cxMemo135: TcxMemo;
    cxMemo136: TcxMemo;
    cxMemo137: TcxMemo;
    cxMemo138: TcxMemo;
    cxMemo139: TcxMemo;
    cxMemo140: TcxMemo;
    cxMemo141: TcxMemo;
    e00_5302_1_1: TcxTextEdit;
    e10_5302_2_1: TcxTextEdit;
    e20_5302_3_1: TcxTextEdit;
    e30_5302_4_1: TcxTextEdit;
    e40_5302_5_1: TcxTextEdit;
    e50_5302_6_1: TcxTextEdit;
    e60_5302_7_1: TcxTextEdit;
    e70_5302_8_1: TcxTextEdit;
    e80_5302_9_1: TcxTextEdit;
    e90_5302_10_1: TcxTextEdit;
    e100_5302_11_1: TcxTextEdit;
    e110_5302_12_1: TcxTextEdit;
    e120_5302_13_1: TcxTextEdit;
    cxTabSheet5: TcxTabSheet;
    cxMemo142: TcxMemo;
    cxMemo143: TcxMemo;
    cxMemo144: TcxMemo;
    e00_5303_1_1: TcxTextEdit;
    e10_5303_2_1: TcxTextEdit;
    cxMemo145: TcxMemo;
    cxTabSheet6: TcxTabSheet;
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
    e20_5401_3_3: TcxTextEdit;
    e00_5401_1_3: TcxTextEdit;
    e10_5401_2_3: TcxTextEdit;
    e30_5401_4_3: TcxTextEdit;
    e40_5401_5_3: TcxTextEdit;
    e50_5401_6_3: TcxTextEdit;
    e60_5401_7_3: TcxTextEdit;
    cxTextEdit8: TcxTextEdit;
    e80_5401_8_3: TcxTextEdit;
    e90_5401_9_3: TcxTextEdit;
    e100_5401_10_3: TcxTextEdit;
    e110_5401_11_3: TcxTextEdit;
    e01_5401_1_4: TcxTextEdit;
    e11_5401_2_4: TcxTextEdit;
    e21_5401_3_4: TcxTextEdit;
    e31_5401_4_4: TcxTextEdit;
    e41_5401_5_4: TcxTextEdit;
    e51_5401_6_4: TcxTextEdit;
    e61_5401_7_4: TcxTextEdit;
    cxTextEdit20: TcxTextEdit;
    e81_5401_8_4: TcxTextEdit;
    e91_5401_9_4: TcxTextEdit;
    e101_5401_10_4: TcxTextEdit;
    e111_5401_11_4: TcxTextEdit;
    e02_5401_1_5: TcxTextEdit;
    e12_5401_2_5: TcxTextEdit;
    e22_5401_3_5: TcxTextEdit;
    e32_5401_4_5: TcxTextEdit;
    e42_5401_5_5: TcxTextEdit;
    e52_5401_6_5: TcxTextEdit;
    e62_5401_7_5: TcxTextEdit;
    cxTextEdit32: TcxTextEdit;
    e82_5401_8_5: TcxTextEdit;
    e92_5401_9_5: TcxTextEdit;
    e102_5401_10_5: TcxTextEdit;
    e112_5401_11_5: TcxTextEdit;
    cxTabSheet7: TcxTabSheet;
    cxMemo181: TcxMemo;
    cxMemo182: TcxMemo;
    e00_5402_1_1: TcxTextEdit;
    cxMemo183: TcxMemo;
    cxMemo184: TcxMemo;
    cxMemo185: TcxMemo;
    cxMemo186: TcxMemo;
    cxMemo187: TcxMemo;
    cxMemo188: TcxMemo;
    cxMemo189: TcxMemo;
    cxMemo190: TcxMemo;
    cxMemo191: TcxMemo;
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
    cxMemo210: TcxMemo;
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
    e10_5402_2_1: TcxTextEdit;
    e20_5402_3_1: TcxTextEdit;
    e30_5402_4_1: TcxTextEdit;
    e40_5402_5_1: TcxTextEdit;
    e50_5402_6_1: TcxTextEdit;
    e60_5402_7_1: TcxTextEdit;
    e70_5402_8_1: TcxTextEdit;
    e80_5402_9_1: TcxTextEdit;
    e90_5402_10_1: TcxTextEdit;
    e100_5402_11_1: TcxTextEdit;
    e110_5402_12_1: TcxTextEdit;
    e120_5402_13_1: TcxTextEdit;
    e130_5402_14_1: TcxTextEdit;
    e140_5402_15_1: TcxTextEdit;
    e150_5402_16_1: TcxTextEdit;
    e160_5402_17_1: TcxTextEdit;
    e170_5402_18_1: TcxTextEdit;
    e180_5402_19_1: TcxTextEdit;
    e190_5402_20_1: TcxTextEdit;
    cxTabSheet8: TcxTabSheet;
    cxMemo221: TcxMemo;
    cxMemo222: TcxMemo;
    e00_5403_1_1: TcxTextEdit;
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
    e10_5403_2_1: TcxTextEdit;
    e20_5403_3_1: TcxTextEdit;
    e30_5403_4_1: TcxTextEdit;
    e40_5403_5_1: TcxTextEdit;
    e50_5403_6_1: TcxTextEdit;
    e60_5403_7_1: TcxTextEdit;
    e70_5403_8_1: TcxTextEdit;
    e80_5403_9_1: TcxTextEdit;
    e90_5403_10_1: TcxTextEdit;
    e100_5403_11_1: TcxTextEdit;
    cxTabSheet9: TcxTabSheet;
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
    e00_5500_1_3: TcxTextEdit;
    e10_5500_2_3: TcxTextEdit;
    e20_5500_3_3: TcxTextEdit;
    e30_5500_4_3: TcxTextEdit;
    e40_5500_5_3: TcxTextEdit;
    e50_5500_6_3: TcxTextEdit;
    e60_5500_7_3: TcxTextEdit;
    e70_5500_8_3: TcxTextEdit;
    e80_5500_9_3: TcxTextEdit;
    e90_5500_10_3: TcxTextEdit;
    e01_5500_1_4: TcxTextEdit;
    e11_5500_2_4: TcxTextEdit;
    e21_5500_3_4: TcxTextEdit;
    e31_5500_4_4: TcxTextEdit;
    e41_5500_5_4: TcxTextEdit;
    e51_5500_6_4: TcxTextEdit;
    e61_5500_7_4: TcxTextEdit;
    e71_5500_8_4: TcxTextEdit;
    e81_5500_9_4: TcxTextEdit;
    e91_5500_10_4: TcxTextEdit;
    cxTabSheet10: TcxTabSheet;
    cxMemo272: TcxMemo;
    cxMemo273: TcxMemo;
    e00_5501_1_1: TcxTextEdit;
    cxMemo274: TcxMemo;
    cxMemo275: TcxMemo;
    cxMemo276: TcxMemo;
    cxMemo277: TcxMemo;
    cxMemo278: TcxMemo;
    cxMemo279: TcxMemo;
    cxMemo280: TcxMemo;
    cxMemo281: TcxMemo;
    e10_5501_2_1: TcxTextEdit;
    e20_5501_3_1: TcxTextEdit;
    e30_5501_4_1: TcxTextEdit;
    e40_5501_5_1: TcxTextEdit;
    cxMemo78: TcxMemo;
    cxMemo80: TcxMemo;
    e30_5125_4_3: TcxTextEdit;
    e31_5125_4_4: TcxTextEdit;
    e32_5125_4_5: TcxTextEdit;
    e33_5125_4_6: TcxTextEdit;
    e34_5125_4_7: TcxTextEdit;
    e35_5125_4_8: TcxTextEdit;
    procedure osAfterLogOn(Sender: TOracleSession);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure e00_5115_1_3MouseLeave(Sender: TObject);
    procedure e01_5115_1_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e02_5115_1_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e10_5115_2_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e11_5115_2_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e12_5115_2_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e13_5115_2_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e20_5115_3_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e21_5115_3_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e22_5115_3_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e23_5115_3_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e30_5115_4_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e31_5115_4_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e32_5115_4_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e33_5115_4_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e40_5115_5_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e41_5115_5_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e42_5115_5_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e43_5115_5_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e01_5115_1_4MouseLeave(Sender: TObject);
    procedure e02_5115_1_5MouseLeave(Sender: TObject);
    procedure e03_5115_1_6MouseLeave(Sender: TObject);
    procedure e10_5115_2_3MouseLeave(Sender: TObject);
    procedure e11_5115_2_4MouseLeave(Sender: TObject);
    procedure e12_5115_2_5MouseLeave(Sender: TObject);
    procedure e13_5115_2_6MouseLeave(Sender: TObject);
    procedure e20_5115_3_3MouseLeave(Sender: TObject);
    procedure e21_5115_3_4MouseLeave(Sender: TObject);
    procedure e22_5115_3_5MouseLeave(Sender: TObject);
    procedure e23_5115_3_6MouseLeave(Sender: TObject);
    procedure e30_5115_4_3MouseLeave(Sender: TObject);
    procedure e31_5115_4_4MouseLeave(Sender: TObject);
    procedure e32_5115_4_5MouseLeave(Sender: TObject);
    procedure e33_5115_4_6MouseLeave(Sender: TObject);
    procedure e40_5115_5_3MouseLeave(Sender: TObject);
    procedure e41_5115_5_4MouseLeave(Sender: TObject);
    procedure e42_5115_5_5MouseLeave(Sender: TObject);
    procedure e43_5115_5_6MouseLeave(Sender: TObject);
    procedure e50_5115_6_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e51_5115_6_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e52_5115_6_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e53_5115_6_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e50_5115_6_3MouseLeave(Sender: TObject);
    procedure e51_5115_6_4MouseLeave(Sender: TObject);
    procedure e52_5115_6_5MouseLeave(Sender: TObject);
    procedure e53_5115_6_6MouseLeave(Sender: TObject);
    procedure e60_5115_7_3MouseLeave(Sender: TObject);
    procedure e61_5115_7_4MouseLeave(Sender: TObject);
    procedure e62_5115_7_5MouseLeave(Sender: TObject);
    procedure e63_5115_7_6MouseLeave(Sender: TObject);
    procedure e70_5115_8_3MouseLeave(Sender: TObject);
    procedure e71_5115_8_4MouseLeave(Sender: TObject);
    procedure e72_5115_8_5MouseLeave(Sender: TObject);
    procedure e73_5115_8_6MouseLeave(Sender: TObject);
    procedure e80_5115_9_3MouseLeave(Sender: TObject);
    procedure e81_5115_9_4MouseLeave(Sender: TObject);
    procedure e82_5115_9_5MouseLeave(Sender: TObject);
    procedure e83_5115_9_6MouseLeave(Sender: TObject);
    procedure e90_5115_10_3MouseLeave(Sender: TObject);
    procedure e91_5115_10_4MouseLeave(Sender: TObject);
    procedure e92_5115_10_5MouseLeave(Sender: TObject);
    procedure e93_5115_10_6MouseLeave(Sender: TObject);
    procedure e60_5115_7_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e61_5115_7_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e62_5115_7_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e63_5115_7_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e70_5115_8_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e71_5115_8_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e72_5115_8_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e73_5115_8_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e80_5115_9_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e81_5115_9_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e82_5115_9_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e83_5115_9_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e90_5115_10_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e91_5115_10_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e92_5115_10_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e93_5115_10_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure MenuItem1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure e100_5115_11_3MouseLeave(Sender: TObject);
    procedure e100_5115_11_4MouseLeave(Sender: TObject);
    procedure e100_5115_11_5MouseLeave(Sender: TObject);
    procedure e100_5115_11_6MouseLeave(Sender: TObject);
    procedure e110_5115_12_3MouseLeave(Sender: TObject);
    procedure e110_5115_12_4MouseLeave(Sender: TObject);
    procedure e110_5115_12_5MouseLeave(Sender: TObject);
    procedure e110_5115_12_6MouseLeave(Sender: TObject);
    procedure e120_5115_13_3MouseLeave(Sender: TObject);
    procedure e120_5115_13_4MouseLeave(Sender: TObject);
    procedure e120_5115_13_5MouseLeave(Sender: TObject);
    procedure e120_5115_13_6MouseLeave(Sender: TObject);
    procedure e130_5115_14_3MouseLeave(Sender: TObject);
    procedure e130_5115_14_4MouseLeave(Sender: TObject);
    procedure e130_5115_14_5MouseLeave(Sender: TObject);
    procedure e130_5115_14_6MouseLeave(Sender: TObject);
    procedure e140_5115_15_3MouseLeave(Sender: TObject);
    procedure e140_5115_15_4MouseLeave(Sender: TObject);
    procedure e140_5115_15_5MouseLeave(Sender: TObject);
    procedure e140_5115_15_6MouseLeave(Sender: TObject);
    procedure e150_5115_16_3MouseLeave(Sender: TObject);
    procedure e150_5115_16_4MouseLeave(Sender: TObject);
    procedure e150_5115_16_5MouseLeave(Sender: TObject);
    procedure e150_5115_16_6MouseLeave(Sender: TObject);
    procedure e160_5115_17_3MouseLeave(Sender: TObject);
    procedure e160_5115_17_4MouseLeave(Sender: TObject);
    procedure e160_5115_17_5MouseLeave(Sender: TObject);
    procedure e160_5115_17_6MouseLeave(Sender: TObject);
    procedure e170_5115_18_3MouseLeave(Sender: TObject);
    procedure e170_5115_18_4MouseLeave(Sender: TObject);
    procedure e170_5115_18_5MouseLeave(Sender: TObject);
    procedure e170_5115_18_6MouseLeave(Sender: TObject);
    procedure e180_5115_19_3MouseLeave(Sender: TObject);
    procedure e180_5115_19_4MouseLeave(Sender: TObject);
    procedure e180_5115_19_5MouseLeave(Sender: TObject);
    procedure e180_5115_19_6MouseLeave(Sender: TObject);
    procedure e190_5115_20_3MouseLeave(Sender: TObject);
    procedure e190_5115_20_4MouseLeave(Sender: TObject);
    procedure e190_5115_20_5MouseLeave(Sender: TObject);
    procedure e190_5115_20_6MouseLeave(Sender: TObject);
    procedure e200_5115_21_3MouseLeave(Sender: TObject);
    procedure e200_5115_21_4MouseLeave(Sender: TObject);
    procedure e200_5115_21_5MouseLeave(Sender: TObject);
    procedure e200_5115_21_6MouseLeave(Sender: TObject);
    procedure e210_5115_22_3MouseLeave(Sender: TObject);
    procedure e210_5115_22_4MouseLeave(Sender: TObject);
    procedure e210_5115_22_5MouseLeave(Sender: TObject);
    procedure e210_5115_22_6MouseLeave(Sender: TObject);
    procedure e220_5115_23_3MouseLeave(Sender: TObject);
    procedure e220_5115_23_4MouseLeave(Sender: TObject);
    procedure e220_5115_23_5MouseLeave(Sender: TObject);
    procedure e220_5115_23_6MouseLeave(Sender: TObject);
    procedure e230_5115_24_3MouseLeave(Sender: TObject);
    procedure e230_5115_24_4MouseLeave(Sender: TObject);
    procedure e230_5115_24_5MouseLeave(Sender: TObject);
    procedure e230_5115_24_6MouseLeave(Sender: TObject);
    procedure e240_5115_25_3MouseLeave(Sender: TObject);
    procedure e240_5115_25_4MouseLeave(Sender: TObject);
    procedure e240_5115_25_5MouseLeave(Sender: TObject);
    procedure e240_5115_25_6MouseLeave(Sender: TObject);
    procedure e100_5115_11_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e100_5115_11_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e100_5115_11_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e100_5115_11_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e110_5115_12_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e110_5115_12_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e110_5115_12_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e110_5115_12_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e120_5115_13_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e120_5115_13_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e120_5115_13_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e120_5115_13_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e130_5115_14_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e130_5115_14_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e130_5115_14_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e130_5115_14_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e140_5115_15_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e140_5115_15_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e140_5115_15_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e140_5115_15_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e150_5115_16_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e150_5115_16_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e150_5115_16_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e150_5115_16_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e160_5115_17_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e160_5115_17_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e160_5115_17_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e160_5115_17_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e170_5115_18_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e170_5115_18_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e170_5115_18_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e170_5115_18_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e180_5115_19_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e180_5115_19_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e180_5115_19_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e180_5115_19_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e190_5115_20_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e190_5115_20_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e190_5115_20_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e190_5115_20_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e200_5115_21_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e200_5115_21_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e200_5115_21_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e200_5115_21_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e210_5115_22_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e210_5115_22_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e210_5115_22_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e210_5115_22_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e220_5115_23_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e220_5115_23_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e220_5115_23_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e220_5115_23_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e230_5115_24_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e230_5115_24_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e230_5115_24_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e230_5115_24_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e240_5115_25_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e240_5115_25_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e240_5115_25_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e240_5115_25_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e00_5116_1_1MouseLeave(Sender: TObject);
    procedure e00_5116_1_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e00_5115_1_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e00_5125_1_3MouseLeave(Sender: TObject);
    procedure e01_5125_1_4MouseLeave(Sender: TObject);
    procedure e02_5125_1_5MouseLeave(Sender: TObject);
    procedure e03_5125_1_6MouseLeave(Sender: TObject);
    procedure e04_5125_1_7MouseLeave(Sender: TObject);
    procedure e05_5125_1_8MouseLeave(Sender: TObject);
    procedure e10_5125_2_3MouseLeave(Sender: TObject);
    procedure e11_5125_2_4MouseLeave(Sender: TObject);
    procedure e12_5125_2_5MouseLeave(Sender: TObject);
    procedure e13_5125_2_6MouseLeave(Sender: TObject);
    procedure e14_5125_2_7MouseLeave(Sender: TObject);
    procedure e15_5125_2_8MouseLeave(Sender: TObject);
    procedure e20_5125_3_3MouseLeave(Sender: TObject);
    procedure e21_5125_3_4MouseLeave(Sender: TObject);
    procedure e22_5125_3_5MouseLeave(Sender: TObject);
    procedure e23_5125_3_6MouseLeave(Sender: TObject);
    procedure e24_5125_3_7MouseLeave(Sender: TObject);
    procedure e25_5125_3_8MouseLeave(Sender: TObject);
    procedure e00_5125_1_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e01_5125_1_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e02_5125_1_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e03_5125_1_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e04_5125_1_7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e05_5125_1_8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e10_5125_2_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e11_5125_2_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e12_5125_2_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e13_5125_2_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e14_5125_2_7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e15_5125_2_8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e20_5125_3_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e21_5125_3_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e22_5125_3_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e23_5125_3_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e24_5125_3_7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e25_5125_3_8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e00_5300_1_3MouseLeave(Sender: TObject);
    procedure e01_5300_1_4MouseLeave(Sender: TObject);
    procedure e02_5300_1_5MouseLeave(Sender: TObject);
    procedure e03_5300_1_6MouseLeave(Sender: TObject);
    procedure e04_5300_1_7MouseLeave(Sender: TObject);
    procedure e05_5300_1_8MouseLeave(Sender: TObject);
    procedure e06_5300_1_9MouseLeave(Sender: TObject);
    procedure e10_5300_2_3MouseLeave(Sender: TObject);
    procedure e11_5300_2_4MouseLeave(Sender: TObject);
    procedure e12_5300_2_5MouseLeave(Sender: TObject);
    procedure e13_5300_2_6MouseLeave(Sender: TObject);
    procedure e14_5300_2_7MouseLeave(Sender: TObject);
    procedure e15_5300_2_8MouseLeave(Sender: TObject);
    procedure e16_5300_2_9MouseLeave(Sender: TObject);
    procedure e10_5300_2_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e11_5300_2_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e12_5300_2_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e13_5300_2_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e14_5300_2_7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e15_5300_2_8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e16_5300_2_9MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e00_5300_1_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e01_5300_1_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e02_5300_1_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e03_5300_1_6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e04_5300_1_7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e05_5300_1_8MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e06_5300_1_9MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e00_5302_1_1MouseLeave(Sender: TObject);
    procedure e10_5302_2_1MouseLeave(Sender: TObject);
    procedure e20_5302_3_1MouseLeave(Sender: TObject);
    procedure e30_5302_4_1MouseLeave(Sender: TObject);
    procedure e40_5302_5_1MouseLeave(Sender: TObject);
    procedure e50_5302_6_1MouseLeave(Sender: TObject);
    procedure e60_5302_7_1MouseLeave(Sender: TObject);
    procedure e70_5302_8_1MouseLeave(Sender: TObject);
    procedure e80_5302_9_1MouseLeave(Sender: TObject);
    procedure e90_5302_10_1MouseLeave(Sender: TObject);
    procedure e100_5302_11_1MouseLeave(Sender: TObject);
    procedure e110_5302_12_1MouseLeave(Sender: TObject);
    procedure e120_5302_13_1MouseLeave(Sender: TObject);
    procedure e00_5302_1_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e10_5302_2_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e20_5302_3_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e30_5302_4_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e40_5302_5_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e50_5302_6_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e60_5302_7_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e70_5302_8_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e80_5302_9_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e90_5302_10_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e100_5302_11_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e110_5302_12_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e120_5302_13_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e00_5303_1_1MouseLeave(Sender: TObject);
    procedure e10_5303_2_1MouseLeave(Sender: TObject);
    procedure e00_5303_1_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e10_5303_2_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e00_5401_1_3MouseLeave(Sender: TObject);
    procedure e01_5401_1_4MouseLeave(Sender: TObject);
    procedure e02_5401_1_5MouseLeave(Sender: TObject);
    procedure e10_5401_2_3MouseLeave(Sender: TObject);
    procedure e11_5401_2_4MouseLeave(Sender: TObject);
    procedure e12_5401_2_5MouseLeave(Sender: TObject);
    procedure e20_5401_3_3MouseLeave(Sender: TObject);
    procedure e21_5401_3_4MouseLeave(Sender: TObject);
    procedure e22_5401_3_5MouseLeave(Sender: TObject);
    procedure e30_5401_4_3MouseLeave(Sender: TObject);
    procedure e31_5401_4_4MouseLeave(Sender: TObject);
    procedure e32_5401_4_5MouseLeave(Sender: TObject);
    procedure e40_5401_5_3MouseLeave(Sender: TObject);
    procedure e41_5401_5_4MouseLeave(Sender: TObject);
    procedure e42_5401_5_5MouseLeave(Sender: TObject);
    procedure e50_5401_6_3MouseLeave(Sender: TObject);
    procedure e51_5401_6_4MouseLeave(Sender: TObject);
    procedure e52_5401_6_5MouseLeave(Sender: TObject);
    procedure e60_5401_7_3MouseLeave(Sender: TObject);
    procedure e61_5401_7_4MouseLeave(Sender: TObject);
    procedure e62_5401_7_5MouseLeave(Sender: TObject);
    procedure e80_5401_8_3MouseLeave(Sender: TObject);
    procedure e81_5401_8_4MouseLeave(Sender: TObject);
    procedure e82_5401_8_5MouseLeave(Sender: TObject);
    procedure e90_5401_9_3MouseLeave(Sender: TObject);
    procedure e91_5401_9_4MouseLeave(Sender: TObject);
    procedure e92_5401_9_5MouseLeave(Sender: TObject);
    procedure e100_5401_10_3MouseLeave(Sender: TObject);
    procedure e101_5401_10_4MouseLeave(Sender: TObject);
    procedure e102_5401_10_5MouseLeave(Sender: TObject);
    procedure e110_5401_11_3MouseLeave(Sender: TObject);
    procedure e111_5401_11_4MouseLeave(Sender: TObject);
    procedure e112_5401_11_5MouseLeave(Sender: TObject);
    procedure e00_5401_1_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e01_5401_1_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e02_5401_1_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e10_5401_2_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e11_5401_2_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e12_5401_2_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e20_5401_3_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e21_5401_3_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e22_5401_3_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e30_5401_4_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e31_5401_4_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e32_5401_4_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e40_5401_5_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e41_5401_5_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e42_5401_5_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e50_5401_6_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e51_5401_6_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e52_5401_6_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e60_5401_7_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e61_5401_7_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e62_5401_7_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e80_5401_8_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e81_5401_8_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e82_5401_8_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e90_5401_9_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e91_5401_9_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e92_5401_9_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e100_5401_10_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e101_5401_10_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e102_5401_10_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e110_5401_11_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e111_5401_11_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e112_5401_11_5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e00_5402_1_1MouseLeave(Sender: TObject);
    procedure e10_5402_2_1MouseLeave(Sender: TObject);
    procedure e20_5402_3_1MouseLeave(Sender: TObject);
    procedure e30_5402_4_1MouseLeave(Sender: TObject);
    procedure e40_5402_5_1MouseLeave(Sender: TObject);
    procedure e50_5402_6_1MouseLeave(Sender: TObject);
    procedure e60_5402_7_1MouseLeave(Sender: TObject);
    procedure e70_5402_8_1MouseLeave(Sender: TObject);
    procedure e80_5402_9_1MouseLeave(Sender: TObject);
    procedure e90_5402_10_1MouseLeave(Sender: TObject);
    procedure e100_5402_11_1MouseLeave(Sender: TObject);
    procedure e110_5402_12_1MouseLeave(Sender: TObject);
    procedure e120_5402_13_1MouseLeave(Sender: TObject);
    procedure e130_5402_14_1MouseLeave(Sender: TObject);
    procedure e140_5402_15_1MouseLeave(Sender: TObject);
    procedure e150_5402_16_1MouseLeave(Sender: TObject);
    procedure e160_5402_17_1MouseLeave(Sender: TObject);
    procedure e170_5402_18_1MouseLeave(Sender: TObject);
    procedure e180_5402_19_1MouseLeave(Sender: TObject);
    procedure e190_5402_20_1MouseLeave(Sender: TObject);
    procedure e00_5402_1_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e10_5402_2_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e20_5402_3_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e30_5402_4_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e40_5402_5_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e50_5402_6_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e60_5402_7_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e70_5402_8_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e80_5402_9_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e90_5402_10_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e100_5402_11_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e110_5402_12_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e120_5402_13_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e130_5402_14_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e140_5402_15_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e150_5402_16_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e160_5402_17_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e170_5402_18_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e180_5402_19_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e190_5402_20_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e00_5403_1_1MouseLeave(Sender: TObject);
    procedure e10_5403_2_1MouseLeave(Sender: TObject);
    procedure e20_5403_3_1MouseLeave(Sender: TObject);
    procedure e30_5403_4_1MouseLeave(Sender: TObject);
    procedure e40_5403_5_1MouseLeave(Sender: TObject);
    procedure e50_5403_6_1MouseLeave(Sender: TObject);
    procedure e60_5403_7_1MouseLeave(Sender: TObject);
    procedure e70_5403_8_1MouseLeave(Sender: TObject);
    procedure e80_5403_9_1MouseLeave(Sender: TObject);
    procedure e90_5403_10_1MouseLeave(Sender: TObject);
    procedure e100_5403_11_1MouseLeave(Sender: TObject);
    procedure e00_5403_1_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e10_5403_2_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e20_5403_3_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e30_5403_4_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e40_5403_5_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e50_5403_6_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e60_5403_7_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e70_5403_8_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e80_5403_9_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e90_5403_10_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e100_5403_11_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e00_5500_1_3MouseLeave(Sender: TObject);
    procedure e10_5500_2_3MouseLeave(Sender: TObject);
    procedure e20_5500_3_3MouseLeave(Sender: TObject);
    procedure e30_5500_4_3MouseLeave(Sender: TObject);
    procedure e40_5500_5_3MouseLeave(Sender: TObject);
    procedure e50_5500_6_3MouseLeave(Sender: TObject);
    procedure e60_5500_7_3MouseLeave(Sender: TObject);
    procedure e70_5500_8_3MouseLeave(Sender: TObject);
    procedure e80_5500_9_3MouseLeave(Sender: TObject);
    procedure e90_5500_10_3MouseLeave(Sender: TObject);
    procedure e01_5500_1_4MouseLeave(Sender: TObject);
    procedure e11_5500_2_4MouseLeave(Sender: TObject);
    procedure e21_5500_3_4MouseLeave(Sender: TObject);
    procedure e31_5500_4_4MouseLeave(Sender: TObject);
    procedure e41_5500_5_4MouseLeave(Sender: TObject);
    procedure e51_5500_6_4MouseLeave(Sender: TObject);
    procedure e61_5500_7_4MouseLeave(Sender: TObject);
    procedure e71_5500_8_4MouseLeave(Sender: TObject);
    procedure e81_5500_9_4MouseLeave(Sender: TObject);
    procedure e91_5500_10_4MouseLeave(Sender: TObject);
    procedure e00_5500_1_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e10_5500_2_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e20_5500_3_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e30_5500_4_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e40_5500_5_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e50_5500_6_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e60_5500_7_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e70_5500_8_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e80_5500_9_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e90_5500_10_3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e01_5500_1_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e11_5500_2_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e21_5500_3_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e31_5500_4_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e41_5500_5_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e51_5500_6_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e61_5500_7_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e71_5500_8_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e81_5500_9_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e91_5500_10_4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e00_5501_1_1MouseLeave(Sender: TObject);
    procedure e10_5501_2_1MouseLeave(Sender: TObject);
    procedure e20_5501_3_1MouseLeave(Sender: TObject);
    procedure e30_5501_4_1MouseLeave(Sender: TObject);
    procedure e40_5501_5_1MouseLeave(Sender: TObject);
    procedure e00_5501_1_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e10_5501_2_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e20_5501_3_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e30_5501_4_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e40_5501_5_1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure e30_5125_4_3MouseLeave(Sender: TObject);
    procedure e30_5125_4_3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure e31_5125_4_4MouseLeave(Sender: TObject);
    procedure e32_5125_4_5MouseLeave(Sender: TObject);
    procedure e33_5125_4_6MouseLeave(Sender: TObject);
    procedure e34_5125_4_7MouseLeave(Sender: TObject);
    procedure e35_5125_4_8MouseLeave(Sender: TObject);
    procedure e31_5125_4_4MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure e32_5125_4_5MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure e33_5125_4_6MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure e34_5125_4_7MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure e35_5125_4_8MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    get_issledid, get_analid : Integer;
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

uses fMetodics;

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.e50_5115_6_3MouseLeave(Sender: TObject);
begin
e50_5115_6_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e50_5115_6_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e50_5115_6_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e50_5302_6_1MouseLeave(Sender: TObject);
begin
e50_5302_6_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e50_5302_6_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e50_5302_6_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e50_5401_6_3MouseLeave(Sender: TObject);
begin
e50_5401_6_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e50_5401_6_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e50_5401_6_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e50_5402_6_1MouseLeave(Sender: TObject);
begin
e50_5402_6_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e50_5402_6_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e50_5402_6_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e50_5403_6_1MouseLeave(Sender: TObject);
begin
e50_5403_6_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e50_5403_6_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e50_5403_6_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e50_5500_6_3MouseLeave(Sender: TObject);
begin
e50_5500_6_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e50_5500_6_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e50_5500_6_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e51_5115_6_4MouseLeave(Sender: TObject);
begin
e51_5115_6_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e51_5115_6_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e51_5115_6_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e51_5401_6_4MouseLeave(Sender: TObject);
begin
e51_5401_6_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e51_5401_6_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e51_5401_6_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e51_5500_6_4MouseLeave(Sender: TObject);
begin
e51_5500_6_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e51_5500_6_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e51_5500_6_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e53_5115_6_6MouseLeave(Sender: TObject);
begin
e53_5115_6_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e53_5115_6_6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e53_5115_6_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e52_5115_6_5MouseLeave(Sender: TObject);
begin
  e52_5115_6_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e52_5115_6_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e52_5115_6_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e52_5401_6_5MouseLeave(Sender: TObject);
begin
e52_5401_6_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e52_5401_6_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e52_5401_6_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e60_5115_7_3MouseLeave(Sender: TObject);
begin
  e60_5115_7_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e60_5115_7_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e60_5115_7_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e60_5302_7_1MouseLeave(Sender: TObject);
begin
e60_5302_7_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e60_5302_7_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e60_5302_7_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e60_5401_7_3MouseLeave(Sender: TObject);
begin
e60_5401_7_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e60_5401_7_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e60_5401_7_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e60_5402_7_1MouseLeave(Sender: TObject);
begin
e60_5402_7_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e60_5402_7_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e60_5402_7_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e60_5403_7_1MouseLeave(Sender: TObject);
begin
e60_5403_7_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e60_5403_7_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e60_5403_7_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e60_5500_7_3MouseLeave(Sender: TObject);
begin
e60_5500_7_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e60_5500_7_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e60_5500_7_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e61_5115_7_4MouseLeave(Sender: TObject);
begin
  e61_5115_7_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e61_5115_7_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e61_5115_7_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e61_5401_7_4MouseLeave(Sender: TObject);
begin
e61_5401_7_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e61_5401_7_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e61_5401_7_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e61_5500_7_4MouseLeave(Sender: TObject);
begin
e61_5500_7_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e61_5500_7_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e61_5500_7_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e62_5115_7_5MouseLeave(Sender: TObject);
begin
e62_5115_7_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e62_5115_7_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e62_5115_7_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e62_5401_7_5MouseLeave(Sender: TObject);
begin
e62_5401_7_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e62_5401_7_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e62_5401_7_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e63_5115_7_6MouseLeave(Sender: TObject);
begin
e63_5115_7_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e63_5115_7_6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e63_5115_7_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e70_5115_8_3MouseLeave(Sender: TObject);
begin
e70_5115_8_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e70_5115_8_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e70_5115_8_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e70_5302_8_1MouseLeave(Sender: TObject);
begin
e70_5302_8_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e70_5302_8_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e70_5302_8_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e70_5402_8_1MouseLeave(Sender: TObject);
begin
e70_5402_8_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e70_5402_8_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e70_5402_8_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e70_5403_8_1MouseLeave(Sender: TObject);
begin
e70_5403_8_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e70_5403_8_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e70_5403_8_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e70_5500_8_3MouseLeave(Sender: TObject);
begin
e70_5500_8_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e70_5500_8_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e70_5500_8_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e71_5115_8_4MouseLeave(Sender: TObject);
begin
e71_5115_8_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e71_5115_8_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e71_5115_8_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e71_5500_8_4MouseLeave(Sender: TObject);
begin
e71_5500_8_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e71_5500_8_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e71_5500_8_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e72_5115_8_5MouseLeave(Sender: TObject);
begin
e72_5115_8_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e72_5115_8_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e72_5115_8_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e73_5115_8_6MouseLeave(Sender: TObject);
begin
e73_5115_8_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e73_5115_8_6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e73_5115_8_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e80_5115_9_3MouseLeave(Sender: TObject);
begin
e80_5115_9_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e80_5115_9_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e80_5115_9_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e80_5302_9_1MouseLeave(Sender: TObject);
begin
e80_5302_9_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e80_5302_9_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e80_5302_9_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e80_5401_8_3MouseLeave(Sender: TObject);
begin
e80_5401_8_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e80_5401_8_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e80_5401_8_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e80_5402_9_1MouseLeave(Sender: TObject);
begin
e80_5402_9_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e80_5402_9_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e80_5402_9_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e80_5403_9_1MouseLeave(Sender: TObject);
begin
e80_5403_9_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e80_5403_9_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e80_5403_9_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e80_5500_9_3MouseLeave(Sender: TObject);
begin
e80_5500_9_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e80_5500_9_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e80_5500_9_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e81_5115_9_4MouseLeave(Sender: TObject);
begin
e81_5115_9_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e81_5115_9_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e81_5115_9_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e81_5401_8_4MouseLeave(Sender: TObject);
begin
e81_5401_8_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e81_5401_8_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e81_5401_8_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e81_5500_9_4MouseLeave(Sender: TObject);
begin
e81_5500_9_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e81_5500_9_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e81_5500_9_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e82_5115_9_5MouseLeave(Sender: TObject);
begin
e82_5115_9_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e82_5115_9_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e82_5115_9_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e82_5401_8_5MouseLeave(Sender: TObject);
begin
e82_5401_8_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e82_5401_8_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e82_5401_8_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e83_5115_9_6MouseLeave(Sender: TObject);
begin
e83_5115_9_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e83_5115_9_6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e83_5115_9_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e90_5115_10_3MouseLeave(Sender: TObject);
begin
e90_5115_10_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e90_5115_10_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  e90_5115_10_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e90_5302_10_1MouseLeave(Sender: TObject);
begin
e90_5302_10_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e90_5302_10_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e90_5302_10_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e90_5401_9_3MouseLeave(Sender: TObject);
begin
e90_5401_9_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e90_5401_9_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e90_5401_9_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e90_5402_10_1MouseLeave(Sender: TObject);
begin
e90_5402_10_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e90_5402_10_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e90_5402_10_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e90_5403_10_1MouseLeave(Sender: TObject);
begin
e90_5403_10_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e90_5403_10_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e90_5403_10_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e90_5500_10_3MouseLeave(Sender: TObject);
begin
e90_5500_10_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e90_5500_10_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e90_5500_10_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e91_5115_10_4MouseLeave(Sender: TObject);
begin
e91_5115_10_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e91_5115_10_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  e91_5115_10_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e91_5401_9_4MouseLeave(Sender: TObject);
begin
e91_5401_9_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e91_5401_9_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e91_5401_9_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e91_5500_10_4MouseLeave(Sender: TObject);
begin
e91_5500_10_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e91_5500_10_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e91_5500_10_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e92_5115_10_5MouseLeave(Sender: TObject);
begin
e92_5115_10_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e92_5115_10_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  e92_5115_10_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e92_5401_9_5MouseLeave(Sender: TObject);
begin
e92_5401_9_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e92_5401_9_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e92_5401_9_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e93_5115_10_6MouseLeave(Sender: TObject);
begin
e93_5115_10_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e93_5115_10_6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  e93_5115_10_6.Style.BorderStyle := ebsThick;
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
    ods.SQL.Text := ' SELECT FK_SOTRID, ASU.DO_VRACHFIO(FK_SOTRID) AS VRACHFIO, '+#13+
                    '        ASU.GET_ISSLEDID, ASU.GET_ANALID, '+#13+ 
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
    get_issledid := ods.FieldByName('get_issledid').AsInteger;
    get_analid := ods.FieldByName('get_analid').AsInteger;
  finally
    ods.Free;
  end;
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  frmMain.Caption := 'Форма 30. Глава 5 - Настройка('+Ver.FileVersion+'). Пользователь: '+sVrachFIO;
  Ver.Free;

//  MedotradeSign := ReadMedotradeSign; !!!
end;

procedure TfrmMain.e00_5115_1_3MouseLeave(Sender: TObject);
begin
  e00_5115_1_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e00_5115_1_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e00_5115_1_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e00_5116_1_1MouseLeave(Sender: TObject);
begin
  e00_5116_1_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e00_5116_1_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e00_5116_1_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e00_5125_1_3MouseLeave(Sender: TObject);
begin
e00_5125_1_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e00_5125_1_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e00_5125_1_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e00_5300_1_3MouseLeave(Sender: TObject);
begin
e00_5300_1_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e00_5300_1_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e00_5300_1_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e00_5302_1_1MouseLeave(Sender: TObject);
begin
e00_5302_1_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e00_5302_1_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e00_5302_1_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e00_5303_1_1MouseLeave(Sender: TObject);
begin
e00_5303_1_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e00_5303_1_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e00_5303_1_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e00_5401_1_3MouseLeave(Sender: TObject);
begin
e00_5401_1_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e00_5401_1_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e00_5401_1_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e00_5402_1_1MouseLeave(Sender: TObject);
begin
e00_5402_1_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e00_5402_1_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e00_5402_1_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e00_5403_1_1MouseLeave(Sender: TObject);
begin
e00_5403_1_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e00_5403_1_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e00_5403_1_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e00_5500_1_3MouseLeave(Sender: TObject);
begin
e00_5500_1_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e00_5500_1_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e00_5500_1_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e00_5501_1_1MouseLeave(Sender: TObject);
begin
e00_5501_1_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e00_5501_1_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e00_5501_1_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e01_5115_1_4MouseLeave(Sender: TObject);
begin
e01_5115_1_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e01_5115_1_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e01_5115_1_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e01_5125_1_4MouseLeave(Sender: TObject);
begin
  e01_5125_1_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e01_5125_1_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e01_5125_1_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e01_5300_1_4MouseLeave(Sender: TObject);
begin
  e01_5300_1_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e01_5300_1_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e01_5300_1_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e01_5401_1_4MouseLeave(Sender: TObject);
begin
e01_5401_1_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e01_5401_1_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e01_5401_1_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e01_5500_1_4MouseLeave(Sender: TObject);
begin
e01_5500_1_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e01_5500_1_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e01_5500_1_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e02_5115_1_5MouseLeave(Sender: TObject);
begin
  e02_5115_1_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e02_5115_1_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e02_5115_1_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e02_5125_1_5MouseLeave(Sender: TObject);
begin
  e02_5125_1_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e02_5125_1_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e02_5125_1_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e02_5300_1_5MouseLeave(Sender: TObject);
begin
  e02_5300_1_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e02_5300_1_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e02_5300_1_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e02_5401_1_5MouseLeave(Sender: TObject);
begin
e02_5401_1_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e02_5401_1_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e02_5401_1_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e03_5115_1_6MouseLeave(Sender: TObject);
begin
  e03_5115_1_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e03_5125_1_6MouseLeave(Sender: TObject);
begin
  e03_5125_1_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e03_5125_1_6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e03_5125_1_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e03_5300_1_6MouseLeave(Sender: TObject);
begin
  e03_5300_1_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e03_5300_1_6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e03_5300_1_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e04_5125_1_7MouseLeave(Sender: TObject);
begin
  e04_5125_1_7.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e04_5125_1_7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  e04_5125_1_7.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e04_5300_1_7MouseLeave(Sender: TObject);
begin
  e04_5300_1_7.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e04_5300_1_7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e04_5300_1_7.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e05_5125_1_8MouseLeave(Sender: TObject);
begin
e05_5125_1_8.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e05_5125_1_8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e05_5125_1_8.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e05_5300_1_8MouseLeave(Sender: TObject);
begin
e05_5300_1_8.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e05_5300_1_8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e05_5300_1_8.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e06_5300_1_9MouseLeave(Sender: TObject);
begin
e06_5300_1_9.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e06_5300_1_9MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e06_5300_1_9.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e100_5115_11_3MouseLeave(Sender: TObject);
begin
  e100_5115_11_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e100_5115_11_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e100_5115_11_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e100_5115_11_4MouseLeave(Sender: TObject);
begin
e100_5115_11_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e100_5115_11_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e100_5115_11_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e100_5115_11_5MouseLeave(Sender: TObject);
begin
e100_5115_11_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e100_5115_11_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e100_5115_11_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e100_5115_11_6MouseLeave(Sender: TObject);
begin
e100_5115_11_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e100_5115_11_6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e100_5115_11_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e100_5302_11_1MouseLeave(Sender: TObject);
begin
e100_5302_11_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e100_5302_11_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e100_5302_11_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e100_5401_10_3MouseLeave(Sender: TObject);
begin
e100_5401_10_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e100_5401_10_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e100_5401_10_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e100_5402_11_1MouseLeave(Sender: TObject);
begin
e100_5402_11_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e100_5402_11_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e100_5402_11_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e100_5403_11_1MouseLeave(Sender: TObject);
begin
e100_5403_11_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e100_5403_11_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e100_5403_11_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e101_5401_10_4MouseLeave(Sender: TObject);
begin
e101_5401_10_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e101_5401_10_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e101_5401_10_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e102_5401_10_5MouseLeave(Sender: TObject);
begin
e102_5401_10_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e102_5401_10_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e102_5401_10_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e10_5115_2_3MouseLeave(Sender: TObject);
begin
  e10_5115_2_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e10_5115_2_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e10_5115_2_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e10_5125_2_3MouseLeave(Sender: TObject);
begin
e10_5125_2_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e10_5125_2_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e10_5125_2_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e10_5300_2_3MouseLeave(Sender: TObject);
begin
e10_5300_2_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e10_5300_2_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e10_5300_2_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e10_5302_2_1MouseLeave(Sender: TObject);
begin
e10_5302_2_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e10_5302_2_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e10_5302_2_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e10_5303_2_1MouseLeave(Sender: TObject);
begin
e10_5303_2_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e10_5303_2_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e10_5303_2_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e10_5401_2_3MouseLeave(Sender: TObject);
begin
e10_5401_2_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e10_5401_2_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e10_5401_2_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e10_5402_2_1MouseLeave(Sender: TObject);
begin
e10_5402_2_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e10_5402_2_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e10_5402_2_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e10_5403_2_1MouseLeave(Sender: TObject);
begin
e10_5403_2_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e10_5403_2_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e10_5403_2_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e10_5500_2_3MouseLeave(Sender: TObject);
begin
e10_5500_2_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e10_5500_2_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e10_5500_2_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e10_5501_2_1MouseLeave(Sender: TObject);
begin
e10_5501_2_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e10_5501_2_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e10_5501_2_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e110_5115_12_3MouseLeave(Sender: TObject);
begin
e110_5115_12_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e110_5115_12_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e110_5115_12_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e110_5115_12_4MouseLeave(Sender: TObject);
begin
e110_5115_12_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e110_5115_12_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e110_5115_12_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e110_5115_12_5MouseLeave(Sender: TObject);
begin
e110_5115_12_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e110_5115_12_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e110_5115_12_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e110_5115_12_6MouseLeave(Sender: TObject);
begin
e110_5115_12_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e110_5115_12_6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e110_5115_12_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e110_5302_12_1MouseLeave(Sender: TObject);
begin
e110_5302_12_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e110_5302_12_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e110_5302_12_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e110_5401_11_3MouseLeave(Sender: TObject);
begin
e110_5401_11_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e110_5401_11_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e110_5401_11_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e110_5402_12_1MouseLeave(Sender: TObject);
begin
e110_5402_12_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e110_5402_12_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e110_5402_12_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e111_5401_11_4MouseLeave(Sender: TObject);
begin
e111_5401_11_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e111_5401_11_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e111_5401_11_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e112_5401_11_5MouseLeave(Sender: TObject);
begin
e112_5401_11_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e112_5401_11_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e112_5401_11_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e11_5115_2_4MouseLeave(Sender: TObject);
begin
e11_5115_2_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e11_5115_2_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e11_5115_2_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e11_5125_2_4MouseLeave(Sender: TObject);
begin
e11_5125_2_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e11_5125_2_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e11_5125_2_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e11_5300_2_4MouseLeave(Sender: TObject);
begin
e11_5300_2_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e11_5300_2_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e11_5300_2_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e11_5401_2_4MouseLeave(Sender: TObject);
begin
e11_5401_2_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e11_5401_2_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e11_5401_2_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e11_5500_2_4MouseLeave(Sender: TObject);
begin
e11_5500_2_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e11_5500_2_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e11_5500_2_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e120_5115_13_3MouseLeave(Sender: TObject);
begin
e120_5115_13_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e120_5115_13_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e120_5115_13_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e120_5115_13_4MouseLeave(Sender: TObject);
begin
e120_5115_13_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e120_5115_13_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e120_5115_13_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e120_5115_13_5MouseLeave(Sender: TObject);
begin
e120_5115_13_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e120_5115_13_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e120_5115_13_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e120_5115_13_6MouseLeave(Sender: TObject);
begin
e120_5115_13_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e120_5115_13_6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e120_5115_13_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e120_5302_13_1MouseLeave(Sender: TObject);
begin
e120_5302_13_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e120_5302_13_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e120_5302_13_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e120_5402_13_1MouseLeave(Sender: TObject);
begin
e120_5402_13_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e120_5402_13_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e120_5402_13_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e12_5115_2_5MouseLeave(Sender: TObject);
begin
e12_5115_2_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e12_5115_2_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e12_5115_2_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e12_5125_2_5MouseLeave(Sender: TObject);
begin
e12_5125_2_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e12_5125_2_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e12_5125_2_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e12_5300_2_5MouseLeave(Sender: TObject);
begin
e12_5300_2_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e12_5300_2_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e12_5300_2_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e12_5401_2_5MouseLeave(Sender: TObject);
begin
e12_5401_2_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e12_5401_2_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e12_5401_2_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e130_5115_14_3MouseLeave(Sender: TObject);
begin
e130_5115_14_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e130_5115_14_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e130_5115_14_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e130_5115_14_4MouseLeave(Sender: TObject);
begin
e130_5115_14_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e130_5115_14_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e130_5115_14_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e130_5115_14_5MouseLeave(Sender: TObject);
begin
e130_5115_14_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e130_5115_14_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e130_5115_14_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e130_5115_14_6MouseLeave(Sender: TObject);
begin
e130_5115_14_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e130_5115_14_6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e130_5115_14_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e130_5402_14_1MouseLeave(Sender: TObject);
begin
e130_5402_14_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e130_5402_14_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e130_5402_14_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e13_5115_2_6MouseLeave(Sender: TObject);
begin
e13_5115_2_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e13_5115_2_6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e13_5115_2_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e13_5125_2_6MouseLeave(Sender: TObject);
begin
e13_5125_2_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e13_5125_2_6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e13_5125_2_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e13_5300_2_6MouseLeave(Sender: TObject);
begin
e13_5300_2_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e13_5300_2_6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e13_5300_2_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e140_5115_15_3MouseLeave(Sender: TObject);
begin
e140_5115_15_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e140_5115_15_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e140_5115_15_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e140_5115_15_4MouseLeave(Sender: TObject);
begin
e140_5115_15_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e140_5115_15_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e140_5115_15_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e140_5115_15_5MouseLeave(Sender: TObject);
begin
e140_5115_15_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e140_5115_15_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e140_5115_15_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e140_5115_15_6MouseLeave(Sender: TObject);
begin
e140_5115_15_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e140_5115_15_6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e140_5115_15_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e140_5402_15_1MouseLeave(Sender: TObject);
begin
e140_5402_15_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e140_5402_15_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e140_5402_15_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e14_5125_2_7MouseLeave(Sender: TObject);
begin
e14_5125_2_7.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e14_5125_2_7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e14_5125_2_7.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e14_5300_2_7MouseLeave(Sender: TObject);
begin
e14_5300_2_7.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e14_5300_2_7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e14_5300_2_7.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e150_5115_16_3MouseLeave(Sender: TObject);
begin
e150_5115_16_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e150_5115_16_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e150_5115_16_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e150_5115_16_4MouseLeave(Sender: TObject);
begin
e150_5115_16_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e150_5115_16_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e150_5115_16_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e150_5115_16_5MouseLeave(Sender: TObject);
begin
e150_5115_16_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e150_5115_16_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e150_5115_16_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e150_5115_16_6MouseLeave(Sender: TObject);
begin
e150_5115_16_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e150_5115_16_6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e150_5115_16_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e150_5402_16_1MouseLeave(Sender: TObject);
begin
e150_5402_16_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e150_5402_16_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e150_5402_16_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e15_5125_2_8MouseLeave(Sender: TObject);
begin
e15_5125_2_8.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e15_5125_2_8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e15_5125_2_8.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e15_5300_2_8MouseLeave(Sender: TObject);
begin
e15_5300_2_8.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e15_5300_2_8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e15_5300_2_8.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e160_5115_17_3MouseLeave(Sender: TObject);
begin
e160_5115_17_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e160_5115_17_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e160_5115_17_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e160_5115_17_4MouseLeave(Sender: TObject);
begin
e160_5115_17_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e160_5115_17_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e160_5115_17_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e160_5115_17_5MouseLeave(Sender: TObject);
begin
e160_5115_17_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e160_5115_17_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e160_5115_17_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e160_5115_17_6MouseLeave(Sender: TObject);
begin
e160_5115_17_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e160_5115_17_6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e160_5115_17_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e160_5402_17_1MouseLeave(Sender: TObject);
begin
e160_5402_17_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e160_5402_17_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e160_5402_17_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e16_5300_2_9MouseLeave(Sender: TObject);
begin
e16_5300_2_9.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e16_5300_2_9MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e16_5300_2_9.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e170_5115_18_3MouseLeave(Sender: TObject);
begin
e170_5115_18_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e170_5115_18_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e170_5115_18_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e170_5115_18_4MouseLeave(Sender: TObject);
begin
e170_5115_18_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e170_5115_18_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e170_5115_18_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e170_5115_18_5MouseLeave(Sender: TObject);
begin
e170_5115_18_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e170_5115_18_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e170_5115_18_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e170_5115_18_6MouseLeave(Sender: TObject);
begin
e170_5115_18_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e170_5115_18_6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e170_5115_18_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e170_5402_18_1MouseLeave(Sender: TObject);
begin
e170_5402_18_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e170_5402_18_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e170_5402_18_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e180_5115_19_3MouseLeave(Sender: TObject);
begin
e180_5115_19_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e180_5115_19_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e180_5115_19_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e180_5115_19_4MouseLeave(Sender: TObject);
begin
e180_5115_19_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e180_5115_19_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e180_5115_19_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e180_5115_19_5MouseLeave(Sender: TObject);
begin
e180_5115_19_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e180_5115_19_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e180_5115_19_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e180_5115_19_6MouseLeave(Sender: TObject);
begin
e180_5115_19_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e180_5115_19_6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e180_5115_19_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e180_5402_19_1MouseLeave(Sender: TObject);
begin
e180_5402_19_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e180_5402_19_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e180_5402_19_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e190_5115_20_3MouseLeave(Sender: TObject);
begin
e190_5115_20_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e190_5115_20_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e190_5115_20_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e190_5115_20_4MouseLeave(Sender: TObject);
begin
e190_5115_20_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e190_5115_20_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e190_5115_20_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e190_5115_20_5MouseLeave(Sender: TObject);
begin
e190_5115_20_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e190_5115_20_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e190_5115_20_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e190_5115_20_6MouseLeave(Sender: TObject);
begin
e190_5115_20_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e190_5115_20_6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e190_5115_20_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e190_5402_20_1MouseLeave(Sender: TObject);
begin
e190_5402_20_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e190_5402_20_1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 e190_5402_20_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e200_5115_21_3MouseLeave(Sender: TObject);
begin
e200_5115_21_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e200_5115_21_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e200_5115_21_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e200_5115_21_4MouseLeave(Sender: TObject);
begin
e200_5115_21_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e200_5115_21_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e200_5115_21_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e200_5115_21_5MouseLeave(Sender: TObject);
begin
e200_5115_21_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e200_5115_21_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e200_5115_21_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e200_5115_21_6MouseLeave(Sender: TObject);
begin
e200_5115_21_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e200_5115_21_6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e200_5115_21_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e20_5115_3_3MouseLeave(Sender: TObject);
begin
e20_5115_3_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e20_5115_3_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e20_5115_3_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e20_5125_3_3MouseLeave(Sender: TObject);
begin
e20_5125_3_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e20_5125_3_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e20_5125_3_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e20_5302_3_1MouseLeave(Sender: TObject);
begin
e20_5302_3_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e20_5302_3_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e20_5302_3_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e20_5401_3_3MouseLeave(Sender: TObject);
begin
e20_5401_3_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e20_5401_3_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e20_5401_3_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e20_5402_3_1MouseLeave(Sender: TObject);
begin
e20_5402_3_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e20_5402_3_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e20_5402_3_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e20_5403_3_1MouseLeave(Sender: TObject);
begin
e20_5403_3_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e20_5403_3_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e20_5403_3_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e20_5500_3_3MouseLeave(Sender: TObject);
begin
e20_5500_3_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e20_5500_3_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e20_5500_3_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e20_5501_3_1MouseLeave(Sender: TObject);
begin
e20_5501_3_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e20_5501_3_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e20_5501_3_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e210_5115_22_3MouseLeave(Sender: TObject);
begin
e210_5115_22_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e210_5115_22_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e210_5115_22_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e210_5115_22_4MouseLeave(Sender: TObject);
begin
e210_5115_22_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e210_5115_22_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e210_5115_22_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e210_5115_22_5MouseLeave(Sender: TObject);
begin
e210_5115_22_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e210_5115_22_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e210_5115_22_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e210_5115_22_6MouseLeave(Sender: TObject);
begin
e210_5115_22_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e210_5115_22_6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e210_5115_22_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e21_5115_3_4MouseLeave(Sender: TObject);
begin
e21_5115_3_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e21_5115_3_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e21_5115_3_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e21_5125_3_4MouseLeave(Sender: TObject);
begin
e21_5125_3_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e21_5125_3_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e21_5125_3_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e21_5401_3_4MouseLeave(Sender: TObject);
begin
e21_5401_3_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e21_5401_3_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e21_5401_3_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e21_5500_3_4MouseLeave(Sender: TObject);
begin
e21_5500_3_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e21_5500_3_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e21_5500_3_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e220_5115_23_3MouseLeave(Sender: TObject);
begin
e220_5115_23_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e220_5115_23_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e220_5115_23_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e220_5115_23_4MouseLeave(Sender: TObject);
begin
e220_5115_23_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e220_5115_23_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e220_5115_23_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e220_5115_23_5MouseLeave(Sender: TObject);
begin
e220_5115_23_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e220_5115_23_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e220_5115_23_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e220_5115_23_6MouseLeave(Sender: TObject);
begin
e220_5115_23_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e220_5115_23_6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e220_5115_23_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e22_5115_3_5MouseLeave(Sender: TObject);
begin
e22_5115_3_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e22_5115_3_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e22_5115_3_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e22_5125_3_5MouseLeave(Sender: TObject);
begin
e22_5125_3_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e22_5125_3_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e22_5125_3_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e22_5401_3_5MouseLeave(Sender: TObject);
begin
e22_5401_3_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e22_5401_3_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e22_5401_3_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e230_5115_24_3MouseLeave(Sender: TObject);
begin
e230_5115_24_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e230_5115_24_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e230_5115_24_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e230_5115_24_4MouseLeave(Sender: TObject);
begin
e230_5115_24_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e230_5115_24_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e230_5115_24_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e230_5115_24_5MouseLeave(Sender: TObject);
begin
e230_5115_24_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e230_5115_24_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e230_5115_24_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e230_5115_24_6MouseLeave(Sender: TObject);
begin
e230_5115_24_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e230_5115_24_6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e230_5115_24_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e23_5115_3_6MouseLeave(Sender: TObject);
begin
e23_5115_3_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e23_5115_3_6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e23_5115_3_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e23_5125_3_6MouseLeave(Sender: TObject);
begin
e23_5125_3_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e23_5125_3_6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e23_5125_3_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e240_5115_25_3MouseLeave(Sender: TObject);
begin
e240_5115_25_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e240_5115_25_3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e240_5115_25_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e240_5115_25_4MouseLeave(Sender: TObject);
begin
e240_5115_25_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e240_5115_25_4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e240_5115_25_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e240_5115_25_5MouseLeave(Sender: TObject);
begin
e240_5115_25_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e240_5115_25_5MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e240_5115_25_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e240_5115_25_6MouseLeave(Sender: TObject);
begin
e240_5115_25_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e240_5115_25_6MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
e240_5115_25_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e24_5125_3_7MouseLeave(Sender: TObject);
begin
e24_5125_3_7.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e24_5125_3_7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e24_5125_3_7.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e25_5125_3_8MouseLeave(Sender: TObject);
begin
e25_5125_3_8.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e25_5125_3_8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e25_5125_3_8.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e30_5115_4_3MouseLeave(Sender: TObject);
begin
e30_5115_4_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e30_5115_4_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e30_5115_4_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e30_5125_4_3MouseLeave(Sender: TObject);
begin
e30_5125_4_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e30_5125_4_3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
e30_5125_4_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e30_5302_4_1MouseLeave(Sender: TObject);
begin
e30_5302_4_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e30_5302_4_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e30_5302_4_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e30_5401_4_3MouseLeave(Sender: TObject);
begin
e30_5401_4_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e30_5401_4_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e30_5401_4_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e30_5402_4_1MouseLeave(Sender: TObject);
begin
e30_5402_4_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e30_5402_4_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e30_5402_4_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e30_5403_4_1MouseLeave(Sender: TObject);
begin
e30_5403_4_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e30_5403_4_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e30_5403_4_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e30_5500_4_3MouseLeave(Sender: TObject);
begin
e30_5500_4_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e30_5500_4_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e30_5500_4_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e30_5501_4_1MouseLeave(Sender: TObject);
begin
e30_5501_4_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e30_5501_4_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e30_5501_4_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e31_5115_4_4MouseLeave(Sender: TObject);
begin
e31_5115_4_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e31_5115_4_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e31_5115_4_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e31_5125_4_4MouseLeave(Sender: TObject);
begin
e31_5125_4_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e31_5125_4_4MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
e31_5125_4_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e31_5401_4_4MouseLeave(Sender: TObject);
begin
e31_5401_4_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e31_5401_4_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e31_5401_4_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e31_5500_4_4MouseLeave(Sender: TObject);
begin
e31_5500_4_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e31_5500_4_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e31_5500_4_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e32_5115_4_5MouseLeave(Sender: TObject);
begin
e32_5115_4_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e32_5115_4_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e32_5115_4_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e32_5125_4_5MouseLeave(Sender: TObject);
begin
e32_5125_4_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e32_5125_4_5MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
e32_5125_4_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e32_5401_4_5MouseLeave(Sender: TObject);
begin
e32_5401_4_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e32_5401_4_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e32_5401_4_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e33_5115_4_6MouseLeave(Sender: TObject);
begin
e33_5115_4_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e33_5115_4_6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e33_5115_4_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e33_5125_4_6MouseLeave(Sender: TObject);
begin
e33_5125_4_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e33_5125_4_6MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
e33_5125_4_6.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e34_5125_4_7MouseLeave(Sender: TObject);
begin
e34_5125_4_7.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e34_5125_4_7MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
e34_5125_4_7.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e35_5125_4_8MouseLeave(Sender: TObject);
begin
e35_5125_4_8.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e35_5125_4_8MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
e35_5125_4_8.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e40_5115_5_3MouseLeave(Sender: TObject);
begin
e40_5115_5_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e40_5115_5_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e40_5115_5_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e40_5302_5_1MouseLeave(Sender: TObject);
begin
e40_5302_5_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e40_5302_5_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e40_5302_5_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e40_5401_5_3MouseLeave(Sender: TObject);
begin
e40_5401_5_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e40_5401_5_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e40_5401_5_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e40_5402_5_1MouseLeave(Sender: TObject);
begin
e40_5402_5_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e40_5402_5_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e40_5402_5_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e40_5403_5_1MouseLeave(Sender: TObject);
begin
e40_5403_5_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e40_5403_5_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e40_5403_5_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e40_5500_5_3MouseLeave(Sender: TObject);
begin
e40_5500_5_3.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e40_5500_5_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e40_5500_5_3.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e40_5501_5_1MouseLeave(Sender: TObject);
begin
e40_5501_5_1.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e40_5501_5_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e40_5501_5_1.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e41_5115_5_4MouseLeave(Sender: TObject);
begin
e41_5115_5_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e41_5115_5_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e41_5115_5_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e41_5401_5_4MouseLeave(Sender: TObject);
begin
e41_5401_5_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e41_5401_5_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e41_5401_5_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e41_5500_5_4MouseLeave(Sender: TObject);
begin
e41_5500_5_4.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e41_5500_5_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e41_5500_5_4.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e42_5115_5_5MouseLeave(Sender: TObject);
begin
e42_5115_5_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e42_5115_5_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e42_5115_5_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e42_5401_5_5MouseLeave(Sender: TObject);
begin
e42_5401_5_5.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e42_5401_5_5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 e42_5401_5_5.Style.BorderStyle := ebsThick;
end;

procedure TfrmMain.e43_5115_5_6MouseLeave(Sender: TObject);
begin
e43_5115_5_6.Style.BorderStyle := ebsUltraFlat;
end;

procedure TfrmMain.e43_5115_5_6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
e43_5115_5_6.Style.BorderStyle := ebsThick;
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

procedure TfrmMain.osAfterLogOn(Sender: TOracleSession);
var Ver: TJclFileVersionInfo;
begin
  Sender.DBMS_Application_Info.Set_Client_Info(ParamStr(1));
  Ver := TJclFileVersionInfo.Create(ExtractFileName(ParamStr(0)));
  Sender.DBMS_Application_Info.Set_Module(ExtractFileName(ParamStr(0)) + ' (' + Ver.FileVersion + ')', Self.Name + ' "' + Self.Caption + '"');
  Ver.Free;
end;

end.
