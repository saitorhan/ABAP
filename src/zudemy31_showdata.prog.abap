*&---------------------------------------------------------------------*
*& Include          ZUDEMY31_SHOWDATA
*&---------------------------------------------------------------------*


form ekrana_yaz.


CLEAR TS_FINAL.


LOOP AT GT_DATA INTO TS_FINAL.
  WRITE:/
   TS_FINAL-CARRID
  , TS_FINAL-CARRNAME
  , TS_FINAL-CONNID
  , TS_FINAL-COUNTRYFR
  , TS_FINAL-CITYFROM
  , TS_FINAL-COUNTRYTO
  , TS_FINAL-CITYTO
  , TS_FINAL-FLDATE
  , TS_FINAL-FLTIME
  , TS_FINAL-DEPTIME.
ENDLOOP.

    ENDFORM.

    FORM MESAJ .
MESSAGE 'İşlem Tamam' TYPE 'S'.
ENDFORM.
