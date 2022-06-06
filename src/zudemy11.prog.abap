*&---------------------------------------------------------------------*
*& Report ZUDEMY08
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY11.

PARAMETERS: P_SAYI1 TYPE I,
            P_SAYI2 TYPE I,
            P_ISLEM TYPE ZDISLEM.

DATA: GV_SONUC TYPE P DECIMALS 2.



CASE P_ISLEM.
  WHEN '+'.
    GV_SONUC = P_SAYI1 + P_SAYI2.
  WHEN '-'.
    GV_SONUC = P_SAYI1 - P_SAYI2.
  WHEN '*'.
    GV_SONUC = P_SAYI1 * P_SAYI2.
  WHEN '/'.
    IF P_SAYI2 NE 0.
      GV_SONUC = P_SAYI1 / P_SAYI2.
    ELSE.
      WRITE 'Sıfıra bölme işlemi yapılamz.'.
    ENDIF.

  ENDCASE.


  WRITE: /'Sonuç: ' , GV_SONUC.
