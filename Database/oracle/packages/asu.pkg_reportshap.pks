DROP PACKAGE ASU.PKG_REPORTSHAP
/

--
-- PKG_REPORTSHAP  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_REPORTSHAP" IS

  FUNCTION GET_HAP(pDate1 IN DATE,
                   pDate2 IN DATE,
                   pWhitePosition IN VARCHAR2,
                   pFormType IN VARCHAR2,
                   pFullReportName IN VARCHAR2,
                   pDefaultText IN VARCHAR2,
                   pRazdel IN VARCHAR2,
                   pFirstWidth IN NUMBER,
                   pColSpan IN NUMBER,
                   pPolugodie IN VARCHAR2) RETURN CLOB;
  FUNCTION GET_BODYHAP(sWhat IN VARCHAR2) RETURN CLOB;
  FUNCTION GET_END(pColSpan IN NUMBER) RETURN CLOB;

  CR VARCHAR2(2):=CHR(10)||CHR(13);
  sNumeration_1INS_1 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '  </tr>'||CR;
  sNumeration_1INS_2 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '  </tr>'||CR;
  sNumeration_1INS_3 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '  </tr>'||CR;
  sNumeration_1INS_4 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '  </tr>'||CR;
  sNumeration_1INS_5 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '  </tr>'||CR;
  sNumeration_2MKO_1 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '  </tr>'||CR;
  sNumeration_2MKO_2 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '  </tr>'||CR;
  sNumeration_2MKO_3 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '  </tr>'||CR;
  sNumeration_3KON_0 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">À</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">Á</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '  </tr>'||CR;
  sNumeration_6VNR_1 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="12" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="3" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">14</td>'||CR||
    '  </tr>'||CR;
  sNumeration_6VNR_2 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="12" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="3" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">14</td>'||CR||
    '  </tr>'||CR;
  sNumeration_6VNR_3 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="12" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="3" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '  </tr>'||CR;
  sNumeration_7ZAB_1 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="12" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="4" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">14</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">15</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">16</td>'||CR||
    '  </tr>'||CR;
  sNumeration_7ZAB_2 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="12" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="4" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '  </tr>'||CR;
  sNumeration_8INF_1 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="12" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="3" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">14</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">15</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">16</td>'||CR||
    '  </tr>'||CR;
  sNumeration_8INF_2 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="12" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="3" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">14</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">15</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">16</td>'||CR||
    '  </tr>'||CR;
  sNumeration_9TRV_0 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '  </tr>'||CR;
  sNumeration_10INV_1 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '  </tr>'||CR;
  sNumeration_10INV_2 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="12" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="3" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">14</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">15</td>'||CR||
    '  </tr>'||CR;
  sNumeration_11SMR_1 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">14</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">15</td>'||CR||
    '  </tr>'||CR;
  sNumeration_11SMR_2 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="12" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="3" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">14</td>'||CR||
    '  </tr>'||CR;
  sNumeration_12AMB_1 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '  </tr>'||CR;
  sNumeration_12AMB_2 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '  </tr>'||CR;
  sNumeration_12AMB_3 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '  </tr>'||CR;
  sNumeration_13STC_1 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '  </tr>'||CR;
  sNumeration_13STC_2 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="12" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="3" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">14</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">15</td>'||CR||
    '  </tr>'||CR;
  sNumeration_13STC_3 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="12" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="3" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">14</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">15</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">16</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">17</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">18</td>'||CR||
    '  </tr>'||CR;
  sNumeration_13STC_4 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '  </tr>'||CR;
  sNumeration_13STC_5 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">14</td>'||CR||
    '  </tr>'||CR;
  sNumeration_14PRM_1 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">14</td>'||CR||
    '  </tr>'||CR;
  sNumeration_14PRM_2 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '  </tr>'||CR;
  sNumeration_14PRM_3 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '  </tr>'||CR;
  sNumeration_14PRM_4 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '  </tr>'||CR;
  sNumeration_14PRM_5 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '  </tr>'||CR;
  sNumeration_15PRF_0 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '  </tr>'||CR;
  sNumeration_16DSP_0 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">14</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">15</td>'||CR||
    '  </tr>'||CR;
  sNumeration_17MOR_0 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '  </tr>'||CR;
  sNumeration_75GAZ_0 VARCHAR2(32767):=
    '  <tr>'||CR||
    '    <td colspan="16" class="WhiteT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">1</td>'||CR||
    '    <td colspan="2" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">2</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">3</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">4</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">5</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">6</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">7</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">8</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">9</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">10</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">11</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">12</td>'||CR||
    '    <td colspan="1" class="WhiteLT" align="center" valign="middle" style="font:bold;" style="vertical-align:middle;">13</td>'||CR||
    '  </tr>'||CR;

  FUNCTION GET_FULLPATH(nID NUMBER, sIdent IN VARCHAR2) RETURN NUMBER;
END;
/

SHOW ERRORS;


