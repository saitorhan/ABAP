*&---------------------------------------------------------------------*
*& Report ZUDEMY07
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY07.

PARAMETERS: P_SAYI TYPE I.

IF P_SAYI > 10.
  WRITE 'Sayı 10''dan büyüktür.'.

ELSEIF P_SAYI < 10.
  WRITE 'Sayı 10''dan küçüktür.'.
ELSE.
  WRITE 'Sayı 10''a eşittir.'.

ENDIF.

WRITE /'Program sonu'.
