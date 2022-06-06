*&---------------------------------------------------------------------*
*& Report ZUDEMY20
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY20.

tables: SCARR.

data: gt_scarr like TABLE OF SCARR,
      gs_scarr like scarr.

select single * from SCARR into Gs_SCARR.

WRITe: 'Kod ', 'Havayolu Adı ', 'Para Birimi ', 'URL'.
WRITE: GS_SCARR-CARRID, GS_SCARR-CARRNAME, GS_SCARR-CURRCODE,  GS_SCARR-URL.

 LOOP AT GT_SCARR into GS_SCARR.
NEW-LINE.
WRITE: GS_SCARR-CARRID, GS_SCARR-CARRNAME, GS_SCARR-CURRCODE,  GS_SCARR-URL.
ULINE.
 ENDLOOP.
