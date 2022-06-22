*&---------------------------------------------------------------------*
*& Report ZALV_LIST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY334.

PARAMETERS: P_DATE1 TYPE S_BDATE,
p_date2 TYPE S_BDATE.

DATA: GT_DATA TYPE ZTBOOK,
      GS_DATA TYPE ZSBOOK.


SELECT * FROM SBOOK AS SB
  JOIN SCARR AS SR ON SB~CARRID EQ SR~CARRID
  JOIN SPFLI AS SF ON SB~CONNID EQ SF~CONNID AND SB~CARRID EQ SF~CARRID
  INTO CORRESPONDING FIELDS OF TABLE GT_DATA
  WHERE SB~ORDER_DATE BETWEEN P_DATE1 AND P_DATE2.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
   I_STRUCTURE_NAME                  = 'ZSBOOK'
  TABLES
    T_OUTTAB                          = GT_DATA
          .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.
