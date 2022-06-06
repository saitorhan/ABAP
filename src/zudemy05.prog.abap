*&---------------------------------------------------------------------*
*& Report ZUDEMY05
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY05.




DATA: GS_OGR TYPE ZOGRENCI.
DATA: GS_OGR3 LIKE GS_OGR.
DATA: GT_OGR TYPE ZOGRENCILER.
data: gv_isim TYPE ZISIM.

PARAMETERS: p_isim TYPE ZISIM,
            p_csyt TYPE ZCINSIYET.

GS_OGR-AD = 'Sait'.
GS_OGR-SOYAD = 'ORHAN'.
GS_OGR-DTARIH = '19890626'.
GS_OGR-CINSIYET = 'E'.

APPEND GS_OGR to GT_OGR.

WRITE GS_OGR-AD.
