*&---------------------------------------------------------------------*
*& Include          ZUDEMY31_GETDATA
*&---------------------------------------------------------------------*

PERFORM BILET_BUL.

IF GT_SBOOK IS INITIAL.
  MESSAGE 'Kayıt bulunamadı' TYPE 'S' DISPLAY LIKE 'E'.
  CHECK 1 = 2.
ENDIF.

PERFORM AYRINTI_BUL.
PERFORM kayit_birlestir.
PERFORM EKRANA_YAZ.
PERFORM Mesaj.



FORM BILET_BUL.
  SELECT * FROM SBOOK
  INTO CORRESPONDING FIELDS OF TABLE GT_SBOOK
  WHERE FLDATE BETWEEN P_TARIH1 AND P_TARIH2.
ENDFORM.


FORM AYRINTI_BUL.

  SELECT * FROM SPFLI
  INTO CORRESPONDING FIELDS OF TABLE GT_SPFLI
  FOR ALL ENTRIES IN GT_SBOOK
  WHERE CARRID = GT_SBOOK-CARRID AND CONNID = GT_SBOOK-CONNID.

  IF GT_SPFLI IS INITIAL.
    MESSAGE 'Kayıt bulunamadı' TYPE 'S' DISPLAY LIKE 'E'.
    CHECK 1 = 2.
  ENDIF.

  SELECT * FROM SCARR
    INTO CORRESPONDING FIELDS OF TABLE GT_SCARR
    FOR ALL ENTRIES IN GT_SPFLI
    WHERE CARRID = GT_SPFLI-CARRID.

  IF GT_SCARR IS INITIAL.
    MESSAGE 'Kayıt bulunamadı' TYPE 'S' DISPLAY LIKE 'E'.
    CHECK 1 = 2.
  ENDIF.

ENDFORM.

form kayit_birlestir.


  LOOP AT GT_SPFLI INTO TS_SPFLI.
  CLEAR TS_FINAL.

  MOVE-CORRESPONDING TS_SPFLI TO TS_FINAL.

  READ TABLE GT_SBOOK INTO TS_SBOOK
  WITH KEY CARRID = TS_SPFLI-CARRID CONNID = TS_SPFLI-CONNID.
  IF SY-SUBRC EQ 0.
    TS_FINAL-FLDATE = TS_SBOOK-FLDATE.
  ENDIF.

  READ TABLE GT_SCARR INTO TS_SCARR
  WITH KEY CARRID = TS_SPFLI-CARRID.
  IF SY-SUBRC EQ 0.
    TS_FINAL-CARRNAME = TS_SCARR-CARRNAME.
  ENDIF.

  APPEND TS_FINAL TO GT_DATA.

ENDLOOP.

  ENDFORM.
