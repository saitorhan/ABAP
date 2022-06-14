*&---------------------------------------------------------------------*
*& Report ZUDEMY32
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY32.


PARAMETERS:p_date1 type S_BDATE,
p_date2 type S_BDATE.

DATA: GTBOOKS TYPE  ZTBOOKS,
      ls_book type sbook,
S_COUNT TYPE  I,
WEEKDAYS  TYPE  ZWEEKDAYS.



CALL FUNCTION 'Z_GET_BOOKS'
  EXPORTING
    DATE1          = P_DATE1
    DATE2          = P_DATE2
 IMPORTING
   GTBOOKS        = GTBOOKS
   S_COUNT        = S_COUNT
   WEEKDAYS       = WEEKDAYS
 EXCEPTIONS
   NOT_FOUNT       = 1
   OTHERS          = 2
          .

LOOP AT GTBOOKS INTO LS_BOOK.
WRITE: / LS_BOOK-PASSNAME.
ENDLOOP.
