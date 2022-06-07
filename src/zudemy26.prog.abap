*&---------------------------------------------------------------------*
*& Report ZUDEMY26
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY26.

DATA: BEGIN OF TS_SCARR,
        CARRNAME  TYPE SCARR-CARRNAME,
        CURRCODE  TYPE SCARR-CURRCODE,
        URL       TYPE SCARR-URL,
        PROMONAME TYPE ZTCARRPROMOS-PROMONAME,
        SDATE     TYPE ZTCARRPROMOS-SDATE,
      END OF TS_SCARR.

      data: gt_data like TABLE OF TS_SCARR.


SELECT * FROM SCARR AS SR
  left JOIN ZTCARRPROMOS AS ZT ON SR~CARRID = ZT~CARRID
  INTO CORRESPONDING FIELDS OF TABLE @GT_DATA
  WHERE ZT~ACTIVE = 'X'.

WRITE 'Kayıtlar alındı'.
