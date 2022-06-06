*&---------------------------------------------------------------------*
*& Report ZUDEMY07
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY09.

PARAMETERS: P_SAYI TYPE I.

IF P_SAYI EQ 10. " =
  WRITE /'Sayı 10''a eşittir.'.
ENDIF.

IF P_SAYI NE 10. " <>
  WRITE /'Sayı 10''dan farklıdır.'.
ENDIF.

IF P_SAYI GT 10. " >
  WRITE /'Sayı 10''dan büyüktür.'.
ENDIF.

IF P_SAYI GE 10. " >=
  WRITE /'Sayı 10''dan büyük veya eşittir.'.
ENDIF.

IF P_SAYI LT 10. " <
  WRITE /'Sayı 10''dan küçüktür.'.
ENDIF.

IF P_SAYI LE 10. " <=
  WRITE /'Sayı 10''dan küçük veya eşittir.'.
ENDIF.

IF P_SAYI BETWEEN 10 AND 20. "
  WRITE /'Sayı 10 ile 20 arasındadır.'.
ENDIF.


IF P_SAYI NOT BETWEEN 10 AND 20. "
  WRITE /'Sayı 10 ile 20 aralığı.'.
ENDIF.

WRITE /'Program sonu'.
