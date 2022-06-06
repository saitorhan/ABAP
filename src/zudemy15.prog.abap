*&---------------------------------------------------------------------*
*& Report ZUDEMY15
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY15.

PARAMETERS: p_sayi TYPE i,
p_ust TYPE i.

data: gv_sonuc TYPE i,
      gv_kuvvet TYPE i.

IF P_UST eq 0.
GV_SONUC = 1.
ELSEIF P_UST eq 1.
  GV_SONUC = P_SAYI.
  else.
    GV_SONUC = P_SAYI.
    GV_KUVVET = P_UST - 1.

   DO GV_KUVVET TIMES.
GV_SONUC = GV_SONUC *  P_SAYI.
   ENDDO.

ENDIF.

WRITE:/ 'Girilen Sayı: ', P_SAYI,
/'Alınacak Üst: ', P_UST,
/'Sonuç: ', GV_SONUC.
