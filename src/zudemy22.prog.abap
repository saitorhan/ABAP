*&---------------------------------------------------------------------*
*& Report ZUDEMY20
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY22.

TABLES: SCARR.

PARAMETERS: P_NAME LIKE SCARR-CARRNAME.

DATA: GT_SCARR LIKE TABLE OF SCARR,
      GS_SCARR LIKE SCARR.

SELECT  * FROM SCARR INTO TABLE GT_SCARR WHERE CARRNAME = P_NAME.

IF SY-SUBRC NE 0.
  MESSAGE S003(ZMUDEMY01) DISPLAY LIKE 'W' WITH P_NAME.
  CHECK 1 = 2.
  else.
    MESSAGE ID 'ZMUDEMY01' TYPE 'S' NUMBER 004.
ENDIF.

WRITE: 'Kod ', 'Havayolu Adı ', 'Para Birimi ', 'URL'.

LOOP AT GT_SCARR INTO GS_SCARR.
  NEW-LINE.
  WRITE: GS_SCARR-CARRID, GS_SCARR-CARRNAME, GS_SCARR-CURRCODE,  GS_SCARR-URL.
  ULINE.
ENDLOOP.
