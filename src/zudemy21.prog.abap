*&---------------------------------------------------------------------*
*& Report ZUDEMY20
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY21.

TABLES: SCARR.

DATA: GT_SCARR LIKE TABLE OF SCARR,
      GS_SCARR LIKE SCARR.
WRITE: 'Kod ', 'Havayolu Adı ', 'Para Birimi ', 'URL'.
SELECT * FROM SCARR INTO GS_SCARR.
  NEW-LINE.
  WRITE: GS_SCARR-CARRID, GS_SCARR-CARRNAME, GS_SCARR-CURRCODE,  GS_SCARR-URL.
  ULINE.
ENDSELECT.
