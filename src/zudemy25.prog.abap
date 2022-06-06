*&---------------------------------------------------------------------*
*& Report ZUDEMY25
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY25.

DATA: BEGIN OF TS_SCARR,
        CARRNAME TYPE SCARR-CARRNAME,
        URL      TYPE SCARR-URL,
      END OF TS_SCARR.

      data: gt_scarr like TABLE OF TS_SCARR.
      data: gs_scarr LIKE TS_SCARR.

      PARAMETERS: p_tarih1 like SBOOK-FLDATE,
      p_tarih2 like SBOOK-FLDATE.

   select SR~CARRNAME SR~URL from SBOOK as sk
     join SCARR as sr on sk~CARRID EQ SR~CARRID
     INTO TABLE GT_SCARR
     where sk~FLDATE BETWEEN P_TARIH1 AND P_TARIH2.

delete ADJACENT DUPLICATES FROM GT_SCARR COMPARING URL.

IF SY-SUBRC EQ 0.
MESSAGE 'Kayırlar ekrana yazıldı.' TYPE 'S'.
else.
  MESSAGE 'Kayıt bulunamadı' TYPE 'E'.
ENDIF.

LOOP AT GT_SCARR INTO GS_SCARR.
  NEW-LINE.
WRITE : GS_SCARR-CARRNAME,  GS_SCARR-URL.
ULINE.
ENDLOOP.
