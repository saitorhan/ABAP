*&---------------------------------------------------------------------*
*& Report ZUDEMY05
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY05.




DATA: GS_OGR TYPE ZOGRENCI.
DATA: GS_OGR3 LIKE GS_OGR.
DATA: GT_OGR TYPE ZOGRENCILER.
DATA: GV_ISIM TYPE ZISIM.

PARAMETERS: P_ISIM TYPE ZISIM,
            P_CSYT TYPE ZCINSIYET.

GS_OGR-AD = 'Sait'.
GS_OGR-SOYAD = 'ORHAN'.
GS_OGR-DTARIH = '19890626'.
GS_OGR-CINSIYET = 'E'.

APPEND GS_OGR TO GT_OGR.

WRITE GS_OGR-AD.

FORM SELAM.
  WRITE:/ 'ZUDEMY05''ten Merhabalar :)'.
ENDFORM.
