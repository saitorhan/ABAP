*&---------------------------------------------------------------------*
*& Report ZUDEMY08
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY10.

PARAMETERS: P_SAYI1 TYPE I,
            P_SAYI2 TYPE I,
            P_ISLEM TYPE ZDISLEM.

DATA: GV_SONUC TYPE P DECIMALS 2.

IF P_ISLEM eq '+' or P_ISLEM eq '-' or P_ISLEM eq '*'
  or ( P_ISLEM eq '/' and P_SAYI2 ne 0 ) .

IF P_ISLEM = '+'.
  GV_SONUC = P_SAYI1 + P_SAYI2.

ELSEIF P_ISLEM = '-'.
  GV_SONUC = P_SAYI1 - P_SAYI2.

ELSEIF P_ISLEM = '/'.
  IF P_SAYI2 NE 0.
    GV_SONUC = P_SAYI1 / P_SAYI2.
    ELSE.
      GV_SONUC = 0.
  ENDIF.



ELSEIF P_ISLEM = '*'.
  GV_SONUC = P_SAYI1 * P_SAYI2.

ENDIF.

ENDIF.




WRITE: 'Sonuç: ' , GV_SONUC.
