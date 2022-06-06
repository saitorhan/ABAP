*&---------------------------------------------------------------------*
*& Report ZUDEMY24
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY24.

PARAMETERS:
  P_AD     TYPE ZISIM,
  P_SOYAD	 TYPE ZSOYAD,
  P_DTARIH TYPE	ZDTARIH,
  P_CNSYT  TYPE ZCINSIYET,
  P_HARC   TYPE ZHARC,
  P_PBIRIM TYPE ZPBIRIM,
  P_YAS	   TYPE ZYAS,
  P_BIRIM	 TYPE ZBIRIM,
  P_BOLUM	 TYPE ZBOLUM.

PARAMETERS: R_INSERT RADIOBUTTON GROUP ISLM,
            R_MODIFY RADIOBUTTON GROUP ISLM,
            R_DELETE RADIOBUTTON GROUP ISLM.

DATA: GS_OGR LIKE ZTOGRENCI.

GS_OGR-AD = P_AD.
GS_OGR-SOYAD = P_SOYAD.
GS_OGR-DTARIH = P_DTARIH.
GS_OGR-CINSIYET = P_CNSYT.
GS_OGR-HARC = P_HARC.
GS_OGR-PBIRIM = P_PBIRIM.
GS_OGR-YAS = P_YAS.
GS_OGR-BIRIM = P_BIRIM.
GS_OGR-BOLUM = P_BOLUM.

IF R_INSERT EQ 'X'.
  INSERT ZTOGRENCI FROM GS_OGR.
ELSEIF R_MODIFY EQ 'X'.
"  MODIFY ZTOGRENCI FROM GS_OGR.
  UPDATE ZTOGRENCI SET HARC = P_HARC WHERE BOLUM = P_BOLUM.
  ELSEIF R_DELETE EQ 'X'.
"    DELETE ZTOGRENCI FROM GS_OGR.
    DELETE FROM ZTOGRENCI WHERE BOLUM = P_BOLUM.
ENDIF.

IF SY-SUBRC EQ 0.
  MESSAGE 'İşlem başarılı' TYPE 'S'.
ELSE.
  MESSAGE 'İşlem Hatalı' TYPE 'E'.
ENDIF.
