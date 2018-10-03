// Verilog module auto-generated for AGC module A24 by dumbVerilog.py

module A24 ( 
  rst, A15_, A16_, BMAGXM, BMAGXP, BMAGYM, BMAGYP, BMAGZP, CA6_, CDUXM, CDUXP,
  CDUYM, CDUYP, CDUZM, CDUZP, CGA24, CI_, CT, CT_, DKCTR4, DKCTR4_, DKCTR5,
  DKCTR5_, F01A, F01B, F02B, F03B_, F04B, F05A, F05B, F06B_, F07A_, F07B,
  F08B_, F09A, F17A, F17B, F18AX, F5ASB0, F5ASB2, FF1109_, FF1110_, FF1111_,
  FF1112_, FS02, FS03, FS04, FS05, FS06, FS06_, FS07A, FS07_, FS08, FS08_,
  FS09, FS16, FS17, GOJAM_, IC11, MP3, NISQ_, OCTAD2, OCTAD3, ODDSET_, PIPGZm,
  PIPGZp, PIPXM, PIPXP, PIPYM, PIPYP, RCH_, RSCT, RT_, RUSG_, SB0, SB1, SB2,
  SB4, SHAFTM, SHAFTP, SUMA15_, SUMB15_, T01DC_, T02, T06, T08, T09DC_, T1P,
  T2P, T3P, T4P, T5P, T6P, TRNM, TRNP, U2BBK, WCH_, WL01, WL02, WL03, WL04,
  WL05, WL06, WL07, WL08, WL09, WL10, WL11, WL12, WL13, WL14, WL16, WT_,
  XB3_, XB4_, XB7_, XT0_, CA2_, CA3_, CTPLS_, F05A_, F05B_, F07B_, F5ASB0_,
  F5ASB2_, FS05_, GOJAM, MNISQ, MON800, MRCH, MWATCH_, MWCH, OUTCOM, PIPZM,
  PIPZP, SB0_, SB1_, SB2_, T01, T02_, T09, BOTHZ, CCHG_, CDUCLK, CDUSTB_,
  CHWL01_, CHWL02_, CHWL03_, CHWL04_, CHWL05_, CHWL06_, CHWL07_, CHWL08_,
  CHWL09_, CHWL10_, CHWL11_, CHWL12_, CHWL13_, CHWL14_, CHWL16_, CI, CNTRSB_,
  ELSNCM, ELSNCN, F04B_, F05D, F07C_, F07D_, F09A_, F09D, F7CSB1_, FLASH,
  FLASH_, FS09_, GTONE, GTRST, GTSET, GTSET_, HIGH0_, HIGH1_, HIGH2_, HIGH3_,
  IC11_, LRRST, MISSZ, NISQ, NOZM, NOZP, ONE, OT1110, OT1111, OT1112, OVNHRP,
  PHS3_, PIPASW, PIPDAT, PIPINT, PIPPLS_, RCHAT_, RCHBT_, RCHG_, RRRST, RSCT_,
  U2BBKG_, US2SG, WATCH, WATCHP, WATCH_, WCHG_, d12KPPS, d25KPPS, d3200A,
  d3200B, d3200C, d3200D, d800RST, d800SET
);

input wire rst, A15_, A16_, BMAGXM, BMAGXP, BMAGYM, BMAGYP, BMAGZP, CA6_,
  CDUXM, CDUXP, CDUYM, CDUYP, CDUZM, CDUZP, CGA24, CI_, CT, CT_, DKCTR4,
  DKCTR4_, DKCTR5, DKCTR5_, F01A, F01B, F02B, F03B_, F04B, F05A, F05B, F06B_,
  F07A_, F07B, F08B_, F09A, F17A, F17B, F18AX, F5ASB0, F5ASB2, FF1109_, FF1110_,
  FF1111_, FF1112_, FS02, FS03, FS04, FS05, FS06, FS06_, FS07A, FS07_, FS08,
  FS08_, FS09, FS16, FS17, GOJAM_, IC11, MP3, NISQ_, OCTAD2, OCTAD3, ODDSET_,
  PIPGZm, PIPGZp, PIPXM, PIPXP, PIPYM, PIPYP, RCH_, RSCT, RT_, RUSG_, SB0,
  SB1, SB2, SB4, SHAFTM, SHAFTP, SUMA15_, SUMB15_, T01DC_, T02, T06, T08,
  T09DC_, T1P, T2P, T3P, T4P, T5P, T6P, TRNM, TRNP, U2BBK, WCH_, WL01, WL02,
  WL03, WL04, WL05, WL06, WL07, WL08, WL09, WL10, WL11, WL12, WL13, WL14,
  WL16, WT_, XB3_, XB4_, XB7_, XT0_;

inout wire CA2_, CA3_, CTPLS_, F05A_, F05B_, F07B_, F5ASB0_, F5ASB2_, FS05_,
  GOJAM, MNISQ, MON800, MRCH, MWATCH_, MWCH, OUTCOM, PIPZM, PIPZP, SB0_,
  SB1_, SB2_, T01, T02_, T09;

output wire BOTHZ, CCHG_, CDUCLK, CDUSTB_, CHWL01_, CHWL02_, CHWL03_, CHWL04_,
  CHWL05_, CHWL06_, CHWL07_, CHWL08_, CHWL09_, CHWL10_, CHWL11_, CHWL12_,
  CHWL13_, CHWL14_, CHWL16_, CI, CNTRSB_, ELSNCM, ELSNCN, F04B_, F05D, F07C_,
  F07D_, F09A_, F09D, F7CSB1_, FLASH, FLASH_, FS09_, GTONE, GTRST, GTSET,
  GTSET_, HIGH0_, HIGH1_, HIGH2_, HIGH3_, IC11_, LRRST, MISSZ, NISQ, NOZM,
  NOZP, ONE, OT1110, OT1111, OT1112, OVNHRP, PHS3_, PIPASW, PIPDAT, PIPINT,
  PIPPLS_, RCHAT_, RCHBT_, RCHG_, RRRST, RSCT_, U2BBKG_, US2SG, WATCH, WATCHP,
  WATCH_, WCHG_, d12KPPS, d25KPPS, d3200A, d3200B, d3200C, d3200D, d800RST,
  d800SET;

// Gate A24-U210A
assign #0.2  A24U208Pad3 = rst ? 0 : ~(0|A24U210Pad2|A24U210Pad3);
// Gate A24-U209B
assign #0.2  A24U209Pad9 = rst ? 0 : ~(0|A24U207Pad3|A24U207Pad4|A24U207Pad8);
// Gate A24-U244A
assign #0.2  T01 = rst ? 0 : ~(0|ODDSET_|T01DC_);
// Gate A24-U247A
assign #0.2  F04B_ = rst ? 1 : ~(0|F04B);
// Gate A24-U207B
assign #0.2  PIPZM = rst ? 0 : ~(0|A24U207Pad6|A24U207Pad3|A24U207Pad8);
// Gate A24-U209A
assign #0.2  A24U209Pad1 = rst ? 0 : ~(0|A24U207Pad2|A24U207Pad6|A24U207Pad3);
// Gate A24-U204A
assign #0.2  GTSET = rst ? 0 : ~(0|FS06_|F05B_|A24U204Pad4);
// Gate A24-U205A
assign #0.2  A24U205Pad1 = rst ? 0 : ~(0|FS08_|FS07_|FS09_);
// Gate A24-U250A
assign #0.2  MRCH = rst ? 0 : ~(0|RCH_);
// Gate A24-U130A A24-U130B
assign #0.2  CHWL09_ = rst ? 1 : ~(0|WL09);
// Gate A24-U102B
assign #0.2  A24U102Pad9 = rst ? 0 : ~(0|A16_|A24U101Pad1);
// Gate A24-U139A
assign #0.2  LRRST = rst ? 0 : ~(0|F05B_|SB1_);
// Gate A24-U102A
assign #0.2  A24U102Pad1 = rst ? 1 : ~(0|A24U101Pad9|A15_);
// Gate A24-U139B
assign #0.2  RRRST = rst ? 0 : ~(0|F05B_|SB1_);
// Gate A24-U123A A24-U123B
assign #0.2  CHWL02_ = rst ? 1 : ~(0|WL02);
// Gate A24-U104A
assign #0.2  A24U104Pad1 = rst ? 0 : ~(0|NISQ_|A24U102Pad9|A24U102Pad1);
// Gate A24-U250B
assign #0.2  MWCH = rst ? 0 : ~(0|WCH_);
// Gate A24-U247B
assign #0.2  F05D = rst ? 0 : ~(0|FS05_|F04B_);
// Gate A24-U104B
assign #0.2  A24U104Pad9 = rst ? 0 : ~(0|A24U103Pad1|OVNHRP);
// Gate A24-U228A
assign #0.2  A24U228Pad1 = rst ? 0 : ~(0|NOZM|F18AX);
// Gate A24-U110A A24-U110B
assign #0.2  HIGH0_ = rst ? 1 : ~(0|A24U109Pad1);
// Gate A24-U202B A24-U201A
assign #0.2  GTONE = rst ? 0 : ~(0|F05B_|FS06|FS07A|FS09|FS08);
// Gate A24-U149A
assign #0.2  PIPINT = rst ? 0 : ~(0|A24U149Pad2|PIPPLS_);
// Gate A24-U237A
assign #0.2  A24U237Pad1 = rst ? 0 : ~(0|CDUSTB_|T08);
// Gate A24-U227A
assign #0.2  NOZP = rst ? 1 : ~(0|PIPGZp|A24U226Pad1);
// Gate A24-U129A A24-U129B
assign #0.2  CHWL08_ = rst ? 1 : ~(0|WL08);
// Gate A24-U229A
assign #0.2  NOZM = rst ? 1 : ~(0|PIPGZm|A24U228Pad1);
// Gate A24-U151B
assign #0.2  PIPASW = rst ? 0 : ~(0|PIPPLS_|SB1_);
// Gate A24-U244B
assign #0.2  T09 = rst ? 0 : ~(0|ODDSET_|T09DC_);
// Gate A24-U141A
assign #0.2  d3200C = rst ? 0 : ~(0|SB0_|A24U140Pad4|FS05);
// Gate A24-U215A
assign #0.2  CA2_ = rst ? 1 : ~(0|OCTAD2);
// Gate A24-U142B
assign #0.2  d3200B = rst ? 0 : ~(0|F05B_|SB0_);
// Gate A24-U213A
assign #0.2  A24U211Pad2 = rst ? 0 : ~(0|A24U207Pad2|A24U207Pad4|A24U208Pad2);
// Gate A24-U212A
assign #0.2  A24U211Pad3 = rst ? 0 : ~(0|A24U207Pad8|A24U208Pad2|A24U207Pad6);
// Gate A24-U122A A24-U122B
assign #0.2  CHWL01_ = rst ? 1 : ~(0|WL01);
// Gate A24-U142A
assign #0.2  d3200A = rst ? 0 : ~(0|F05A_|SB0_);
// Gate A24-U214A
assign #0.2  BOTHZ = rst ? 0 : ~(0|A24U207Pad8|A24U207Pad2);
// Gate A24-U157A
assign #0.2  A24U156Pad2 = rst ? 0 : ~(0|XB3_|XT0_);
// Gate A24-U112B
assign #0.2  A24U112Pad9 = rst ? 0 : ~(0|DKCTR5_|DKCTR4);
// Gate A24-U207A
assign #0.2  PIPZP = rst ? 0 : ~(0|A24U207Pad2|A24U207Pad3|A24U207Pad4);
// Gate A24-U112A
assign #0.2  A24U112Pad1 = rst ? 0 : ~(0|DKCTR4_|DKCTR5);
// Gate A24-U253A
assign #0.2  CNTRSB_ = rst ? 1 : ~(0|SB2);
// Gate A24-U154A
assign #0.2  ELSNCN = rst ? 0 : ~(0|A24U154Pad2);
// Gate A24-U154B
assign #0.2  ELSNCM = rst ? 0 : ~(0|A24U154Pad2);
// Gate A24-U147B
assign #0.2  d800SET = rst ? 0 : ~(0|SB1_|F07A_);
// Gate A24-U135A
assign #0.2  MON800 = rst ? 1 : ~(0|FS07A);
// Gate A24-U224B
assign #0.2  A24U224Pad9 = rst ? 0 : ~(0|F07C_|SB1_);
// Gate A24-U217B
assign #0.2  A24U216Pad7 = rst ? 0 : ~(0|A24U217Pad7|A24U210Pad3);
// Gate A24-U146B
assign #0.2  CDUCLK = rst ? 0 : ~(0|SB0_|A24U146Pad1);
// Gate A24-U217A
assign #0.2  A24U216Pad3 = rst ? 0 : ~(0|A24U217Pad2|A24U210Pad3);
// Gate A24-U116B A24-U117B A24-U118B
assign #0.2  RCHG_ = rst ? 1 : ~(0|A24U115Pad9);
// Gate A24-U153B
assign #0.2  A24U153Pad2 = rst ? 0 : ~(0|FS04);
// Gate A24-U125A A24-U125B
assign #0.2  CHWL04_ = rst ? 1 : ~(0|WL04);
// Gate A24-U111B
assign #0.2  MWATCH_ = rst ? 1 : ~(0|WATCH);
// Gate A24-U248A A24-U248B
assign #0.2  U2BBKG_ = rst ? 1 : ~(0|U2BBK);
// Gate A24-U239A A24-U239B
assign #0.2  CHWL12_ = rst ? 1 : ~(0|WL12);
// Gate A24-U141B
assign #0.2  A24U140Pad4 = rst ? 1 : ~(0|F04B);
// Gate A24-U113B A24-U114B
assign #0.2  HIGH2_ = rst ? 1 : ~(0|A24U112Pad9);
// Gate A24-U203B
assign #0.2  GTSET_ = rst ? 1 : ~(0|GTSET);
// Gate A24-U218B
assign #0.2  A24U217Pad7 = rst ? 1 : ~(0|A24U217Pad2|A24U218Pad8);
// Gate A24-U218A
assign #0.2  A24U217Pad2 = rst ? 0 : ~(0|A24U218Pad2|A24U217Pad7);
// Gate A24-U226B
assign #0.2  F07D_ = rst ? 1 : ~(0|A24U226Pad8);
// Gate A24-U213B
assign #0.2  F09A_ = rst ? 1 : ~(0|F09A);
// Gate A24-U236A
assign #0.2  IC11_ = rst ? 1 : ~(0|IC11);
// Gate A24-U134A
assign #0.2  d25KPPS = rst ? 0 : ~(0|FS02|SB0_|A24U134Pad4);
// Gate A24-U224A
assign #0.2  MISSZ = rst ? 1 : ~(0|PIPGZp|PIPGZm|A24U224Pad4);
// Gate A24-U240A A24-U240B
assign #0.2  T02_ = rst ? 1 : ~(0|T02);
// Gate A24-U215B
assign #0.2  CA3_ = rst ? 1 : ~(0|OCTAD3);
// Gate A24-U245A A24-U245B A24-U246A A24-U246B
assign #0.2  PHS3_ = rst ? 1 : ~(0|CT);
// Gate A24-U242A A24-U242B
assign #0.2  CHWL14_ = rst ? 1 : ~(0|WL14);
// Gate A24-U152B
assign #0.2  FS05_ = rst ? 0 : ~(0|FS05);
// Gate A24-U124A A24-U124B
assign #0.2  CHWL03_ = rst ? 1 : ~(0|WL03);
// Gate A24-U103A
assign #0.2  A24U103Pad1 = rst ? 0 : ~(0|A24U103Pad2|NISQ_);
// Gate A24-U103B
assign #0.2  A24U103Pad2 = rst ? 0 : ~(0|A24U102Pad1|A24U102Pad9);
// Gate A24-U214B
assign #0.2  A24U210Pad3 = rst ? 1 : ~(0|F5ASB2);
// Gate A24-U211A
assign #0.2  A24U210Pad2 = rst ? 0 : ~(0|A24U211Pad2|A24U211Pad3|A24U210Pad7);
// Gate A24-U211B
assign #0.2  A24U210Pad7 = rst ? 1 : ~(0|A24U209Pad1|A24U210Pad2|A24U209Pad9);
// Gate A24-U106B
assign #0.2  A24U105Pad2 = rst ? 0 : ~(0|XB7_|CA6_|T02_);
// Gate A24-U106A
assign #0.2  A24U105Pad3 = rst ? 0 : ~(0|A24U105Pad1|F17B);
// Gate A24-U145A A24-U145B
assign #0.2  F05A_ = rst ? 1 : ~(0|F05A);
// Gate A24-U105A
assign #0.2  A24U105Pad1 = rst ? 1 : ~(0|A24U105Pad2|A24U105Pad3);
// Gate A24-U225B
assign #0.2  F7CSB1_ = rst ? 1 : ~(0|A24U224Pad9);
// Gate A24-U113A A24-U114A
assign #0.2  HIGH1_ = rst ? 1 : ~(0|A24U112Pad1);
// Gate A24-U159A
assign #0.2  A24U158Pad2 = rst ? 0 : ~(0|XB4_|XT0_);
// Gate A24-U151A
assign #0.2  PIPDAT = rst ? 0 : ~(0|PIPPLS_|SB2_);
// Gate A24-U132B
assign #0.2  F07B_ = rst ? 1 : ~(0|F07B);
// Gate A24-U225A
assign #0.2  A24U224Pad4 = rst ? 0 : ~(0|MISSZ|F5ASB2);
// Gate A24-U133B
assign #0.2  OT1112 = rst ? 0 : ~(0|FF1112_);
// Gate A24-U158A A24-U158B A24-U159B
assign #0.2  RCHAT_ = rst ? 1 : ~(0|A24U158Pad2);
// Gate A24-U136A
assign #0.2  OT1110 = rst ? 0 : ~(0|FF1110_);
// Gate A24-U133A
assign #0.2  OT1111 = rst ? 0 : ~(0|FF1111_);
// Gate A24-U228B
assign #0.2  A24U227Pad8 = rst ? 0 : ~(0|FS07A|F06B_);
// Gate A24-U208B
assign #0.2  A24U208Pad2 = rst ? 1 : ~(0|A24U208Pad7|A24U207Pad3);
// Gate A24-U140A
assign #0.2  d3200D = rst ? 0 : ~(0|SB0_|FS05_|A24U140Pad4);
// Gate A24-U138A A24-U138B
assign #0.2  SB0_ = rst ? 1 : ~(0|SB0);
// Gate A24-U212B
assign #0.2  F5ASB0_ = rst ? 1 : ~(0|F5ASB0);
// Gate A24-U153A
assign #0.2  A24U152Pad2 = rst ? 0 : ~(0|A24U153Pad2|F03B_|FS05);
// Gate A24-U160A A24-U160B
assign #0.2  CHWL10_ = rst ? 1 : ~(0|WL10);
// Gate A24-U230B
assign #0.2  A24U207Pad8 = rst ? 1 : ~(0|PIPGZm);
// Gate A24-U208A
assign #0.2  A24U207Pad3 = rst ? 0 : ~(0|A24U208Pad2|A24U208Pad3);
// Gate A24-U230A
assign #0.2  A24U207Pad2 = rst ? 1 : ~(0|PIPGZp);
// Gate A24-U143A A24-U144A A24-U144B
assign #0.2  F05B_ = rst ? 1 : ~(0|F05B);
// Gate A24-U216A
assign #0.2  A24U207Pad6 = rst ? 0 : ~(0|A24U207Pad4|A24U216Pad3);
// Gate A24-U108A
assign #0.2  A24U108Pad1 = rst ? 0 : ~(0|SB1_|A24U107Pad2);
// Gate A24-U234A A24-U234B A24-U235A A24-U235B A24-U236B
assign #0.2  GOJAM = rst ? 1 : ~(0|GOJAM_);
// Gate A24-U137B
assign #0.2  d12KPPS = rst ? 0 : ~(0|FS03|A24U137Pad1|SB0_);
// Gate A24-U111A
assign #0.2  A24J1Pad146 = rst ? 1 : ~(0);
// Gate A24-U202A
assign #0.2  FS09_ = rst ? 0 : ~(0|FS09);
// Gate A24-U121A A24-U120A A24-U119A
assign #0.2  WCHG_ = rst ? 1 : ~(0|A24U118Pad1);
// Gate A24-U152A
assign #0.2  PIPPLS_ = rst ? 1 : ~(0|A24U152Pad2);
// Gate A24-U233B
assign #0.2  FLASH = rst ? 0 : ~(0|FS17|FS16);
// Gate A24-U227B
assign #0.2  F07C_ = rst ? 1 : ~(0|A24U227Pad8);
// Gate A24-U260A A24-U260B A24-U249A A24-U249B A24-U254B A24-U256A A24-U256B A24-U252A A24-U252B
assign #0.2  CTPLS_ = rst ? 1 : ~(0|BMAGXM|BMAGXP|PIPZM|BMAGYP|BMAGYM|BMAGZP|T4P|T6P|T5P|T1P|T2P|T3P|TRNP|TRNM|SHAFTP|PIPZP|PIPYM|PIPYP|SHAFTM|PIPXP|PIPXM|CDUZM|CDUZP|CDUYM|CDUXP|CDUXM|CDUYP);
// Gate A24-U146A
assign #0.2  A24U146Pad1 = rst ? 1 : ~(0|F01A);
// Gate A24-U147A
assign #0.2  d800RST = rst ? 0 : ~(0|SB1_|F07B_);
// Gate A24-U156A A24-U156B A24-U157B
assign #0.2  RCHBT_ = rst ? 1 : ~(0|A24U156Pad2);
// Gate A24-U148A A24-U148B
assign #0.2  SB1_ = rst ? 1 : ~(0|SB1);
// Gate A24-U149B
assign #0.2  A24U149Pad2 = rst ? 1 : ~(0|SB4);
// Gate A24-U237B
assign #0.2  CDUSTB_ = rst ? 1 : ~(0|T06|A24U237Pad1);
// Gate A24-U115A
assign #0.2  A24U115Pad1 = rst ? 1 : ~(0|DKCTR5_|DKCTR4_);
// Gate A24-U126A A24-U126B
assign #0.2  CHWL05_ = rst ? 1 : ~(0|WL05);
// Gate A24-U155B
assign #0.2  A24J2Pad210 = rst ? 1 : ~(0);
// Gate A24-U155A
assign #0.2  A24U154Pad2 = rst ? 1 : ~(0|FS07A);
// Gate A24-U219B
assign #0.2  A24U218Pad8 = rst ? 0 : ~(0|A24U207Pad6|A24U208Pad2|A24U207Pad2);
// Gate A24-U115B
assign #0.2  A24U115Pad9 = rst ? 0 : ~(0|RCH_|RT_);
// Gate A24-U107B
assign #0.2  A24U107Pad2 = rst ? 1 : ~(0|F17A);
// Gate A24-U238A A24-U238B
assign #0.2  CHWL11_ = rst ? 1 : ~(0|WL11);
// Gate A24-U204B
assign #0.2  GTRST = rst ? 0 : ~(0|FS06|A24U204Pad4|F05B_);
// Gate A24-U233A
assign #0.2  FLASH_ = rst ? 1 : ~(0|FLASH);
// Gate A24-U116A A24-U117A
assign #0.2  HIGH3_ = rst ? 0 : ~(0|A24U115Pad1);
// Gate A24-U201B
assign #0.2  OUTCOM = rst ? 0 : ~(0|FF1109_);
// Gate A24-U101A
assign #0.2  A24U101Pad1 = rst ? 1 : ~(0|A15_);
// Gate A24-U210B
assign #0.2  A24U208Pad7 = rst ? 0 : ~(0|A24U210Pad7|A24U210Pad3);
// Gate A24-U229B
assign #0.2  A24U226Pad8 = rst ? 0 : ~(0|FS07_|F06B_);
// Gate A24-U203A
assign #0.2  CI = rst ? 0 : ~(0|CI_);
// Gate A24-U101B
assign #0.2  A24U101Pad9 = rst ? 0 : ~(0|A16_);
// Gate A24-U253B
assign #0.2  US2SG = rst ? 0 : ~(0|SUMB15_|SUMA15_|RUSG_);
// Gate A24-U150A A24-U150B
assign #0.2  SB2_ = rst ? 1 : ~(0|SB2);
// Gate A24-U121B A24-U120B
assign #0.2  CCHG_ = rst ? 1 : ~(0|A24U119Pad9);
// Gate A24-U128A A24-U128B
assign #0.2  CHWL07_ = rst ? 1 : ~(0|WL07);
// Gate A24-U137A
assign #0.2  A24U137Pad1 = rst ? 1 : ~(0|F02B);
// Gate A24-U108B
assign #0.2  WATCH_ = rst ? 1 : ~(0|WATCHP|WATCH);
// Gate A24-U231A A24-U231B A24-U232B
assign #0.2  F5ASB2_ = rst ? 1 : ~(0|F5ASB2);
// Gate A24-U105B
assign #0.2  OVNHRP = rst ? 1 : ~(0|A24U104Pad1|A24U104Pad9|MP3);
// Gate A24-U206A
assign #0.2  A24U206Pad1 = rst ? 0 : ~(0|F08B_);
// Gate A24-U205B
assign #0.2  A24U204Pad4 = rst ? 1 : ~(0|A24U205Pad1);
// Gate A24-U107A
assign #0.2  WATCHP = rst ? 0 : ~(0|A24U107Pad2|SB2_|A24U105Pad3);
// Gate A24-U232A
assign #0.2  ONE = rst ? 1 : ~(0);
// Gate A24-U136B
assign #0.2  NISQ = rst ? 0 : ~(0|NISQ_);
// Gate A24-U216B
assign #0.2  A24U207Pad4 = rst ? 1 : ~(0|A24U216Pad7|A24U207Pad6);
// Gate A24-U241A A24-U241B
assign #0.2  CHWL13_ = rst ? 1 : ~(0|WL13);
// Gate A24-U118A
assign #0.2  A24U118Pad1 = rst ? 0 : ~(0|WCH_|WT_);
// Gate A24-U127A A24-U127B
assign #0.2  CHWL06_ = rst ? 1 : ~(0|WL06);
// Gate A24-U135B
assign #0.2  MNISQ = rst ? 0 : ~(0|NISQ_);
// Gate A24-U206B
assign #0.2  F09D = rst ? 1 : ~(0|A24U206Pad1|FS09_);
// Gate A24-U219A
assign #0.2  A24U218Pad2 = rst ? 0 : ~(0|A24U207Pad8|A24U208Pad2|A24U207Pad4);
// Gate A24-U226A
assign #0.2  A24U226Pad1 = rst ? 0 : ~(0|F18AX|NOZP);
// Gate A24-U251A A24-U251B
assign #0.2  RSCT_ = rst ? 1 : ~(0|RSCT);
// Gate A24-U243A A24-U243B
assign #0.2  CHWL16_ = rst ? 1 : ~(0|WL16);
// Gate A24-U109B
assign #0.2  WATCH = rst ? 0 : ~(0|WATCH_|A24U108Pad1);
// Gate A24-U109A
assign #0.2  A24U109Pad1 = rst ? 0 : ~(0|DKCTR5|DKCTR4);
// Gate A24-U119B
assign #0.2  A24U119Pad9 = rst ? 0 : ~(0|CT_|WCH_);
// Gate A24-U134B
assign #0.2  A24U134Pad4 = rst ? 1 : ~(0|F01B);

endmodule
