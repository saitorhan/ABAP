*&---------------------------------------------------------------------*
*& Report ZUDEMY17
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY17.


PARAMETERS: P_METIN TYPE STRING.

DATA: GV_UZUNLUK TYPE I.

GV_UZUNLUK = STRLEN( P_METIN ).

WRITE: 'Metin uzunluğu: ', GV_UZUNLUK.
skip 1.

WHILE P_METIN ne SPACE.
WRITE: sy-INDEX, '. Karakter: ', P_METIN(1).
NEW-LINE.
SHIFT P_METIN.
ENDWHILE.
