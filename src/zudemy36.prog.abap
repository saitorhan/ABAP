*&---------------------------------------------------------------------*
*& Report ZUDEMY36
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY36.

TABLES: SBOOK, SCARR.
TYPE-POOLS: SLIS.

DATA: BEGIN OF GT_DATA OCCURS 0,
  LINE_COLOR(4),
  CELL_COLOR TYPE LVC_T_SCOL,
        CARRID     LIKE SBOOK-CARRID,
        CONNID     LIKE SBOOK-CONNID,
        FLDATE     LIKE SBOOK-FLDATE,
        CUSTTYPE   LIKE SBOOK-CUSTTYPE,
        LOCCURAM   LIKE SBOOK-LOCCURAM,
        LOCCURKEY  LIKE SBOOK-LOCCURKEY,
        ORDER_DATE LIKE SBOOK-ORDER_DATE,
        PASSNAME   LIKE SBOOK-PASSNAME,
        CARRNAME   LIKE SCARR-CARRNAME,
        URL        LIKE SCARR-URL,
      END OF GT_DATA.


DATA: GT_FCAT TYPE SLIS_T_FIELDCAT_ALV WITH HEADER LINE.
DATA: LAYOUT TYPE SLIS_LAYOUT_ALV.
DATA: VARIANT TYPE DISVARIANT.

VARIANT-REPORT = SY-REPID.
VARIANT-USERNAME = SY-UNAME.

SELECTION-SCREEN BEGIN OF BLOCK SECIM WITH FRAME TITLE TEXT-001.
SELECT-OPTIONS:
S_FLDATE FOR SBOOK-FLDATE,
S_ORDER FOR SBOOK-ORDER_DATE,
S_CARID FOR SCARR-CARRID.
SELECTION-SCREEN END OF BLOCK SECIM.

SELECT
 SK~CARRID
          SK~CONNID
          SK~FLDATE
          SK~CUSTTYPE
          SK~LOCCURAM
          SK~LOCCURKEY
          SK~ORDER_DATE
          SK~PASSNAME
          SR~CARRNAME
          SR~URL
 FROM SBOOK AS SK JOIN SCARR AS SR ON SK~CARRID EQ SR~CARRID
  INTO CORRESPONDING FIELDS OF TABLE GT_DATA
  WHERE SR~CARRID IN S_CARID
  AND SK~FLDATE IN S_FLDATE
  AND SK~ORDER_DATE IN S_ORDER.

CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
  EXPORTING
    I_PROGRAM_NAME     = SY-REPID
    I_INTERNAL_TABNAME = 'GT_DATA'
*   I_STRUCTURE_NAME   =
*   I_CLIENT_NEVER_DISPLAY       = 'X'
    I_INCLNAME         = SY-REPID
*   I_BYPASSING_BUFFER =
*   I_BUFFER_ACTIVE    =
  CHANGING
    CT_FIELDCAT        = GT_FCAT[]
*   EXCEPTIONS
*   INCONSISTENT_INTERFACE       = 1
*   PROGRAM_ERROR      = 2
*   OTHERS             = 3
  .

LOOP AT GT_FCAT.
  IF GT_FCAT-FIELDNAME EQ 'ORDER_DATE'.
    GT_FCAT-SELTEXT_S = 'S. Tarih'.
    GT_FCAT-SELTEXT_M = 'Sip. Tarih'.
    GT_FCAT-SELTEXT_L = 'Sipariş Tarihi'.
    GT_FCAT-REPTEXT_DDIC = 'Sipariş ATrih'.

    GT_FCAT-EMPHASIZE = 'C511'.

    ELSEIF GT_FCAT-FIELDNAME EQ 'FLDATE'.
GT_FCAT-EMPHASIZE = 'C511'.
GT_FCAT-KEY = ''.
  ENDIF.
  MODIFY GT_FCAT.
ENDLOOP.


LAYOUT-INFO_FIELDNAME = 'LINE_COLOR'.
LAYOUT-COLTAB_FIELDNAME = 'CELL_COLOR'.
LAYOUT-COLWIDTH_OPTIMIZE = 'X'.

LOOP AT GT_DATA.

  DATA: C_COLOR TYPE LINE OF LVC_T_SCOL.

  IF GT_DATA-LOCCURAM BETWEEN 1000 AND 1100 OR
    GT_DATA-LOCCURAM BETWEEN 700 AND 750.
C_COLOR-FNAME = 'LOCCURAM'.
C_COLOR-COLOR-COL = '7'.
C_COLOR-COLOR-INT = '0'.
C_COLOR-COLOR-INV = '0'.
APPEND C_COLOR TO GT_DATA-CELL_COLOR.
  ENDIF.

  MODIFY GT_DATA.
ENDLOOP.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                = ' '
*   I_BUFFER_ACTIVE                   = ' '
*   I_CALLBACK_PROGRAM                = ' '
*   I_CALLBACK_PF_STATUS_SET          = ' '
*   I_CALLBACK_USER_COMMAND           = ' '
*   I_CALLBACK_TOP_OF_PAGE            = ' '
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
*   I_STRUCTURE_NAME                  =
*   I_BACKGROUND_ID                   = ' '
*   I_GRID_TITLE                      =
*   I_GRID_SETTINGS                   =
   IS_LAYOUT   = LAYOUT
    IT_FIELDCAT = GT_FCAT[]
*   IT_EXCLUDING                      =
*   IT_SPECIAL_GROUPS                 =
*   IT_SORT     =
*   IT_FILTER   =
*   IS_SEL_HIDE =
*   I_DEFAULT   = 'X'
   I_SAVE      = 'A'
   IS_VARIANT  = VARIANT
*   IT_EVENTS   =
*   IT_EVENT_EXIT                     =
*   IS_PRINT    =
*   IS_REPREP_ID                      =
*   I_SCREEN_START_COLUMN             = 0
*   I_SCREEN_START_LINE               = 0
*   I_SCREEN_END_COLUMN               = 0
*   I_SCREEN_END_LINE                 = 0
*   I_HTML_HEIGHT_TOP                 = 0
*   I_HTML_HEIGHT_END                 = 0
*   IT_ALV_GRAPHICS                   =
*   IT_HYPERLINK                      =
*   IT_ADD_FIELDCAT                   =
*   IT_EXCEPT_QINFO                   =
*   IR_SALV_FULLSCREEN_ADAPTER        =
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER           =
*   ES_EXIT_CAUSED_BY_USER            =
  TABLES
    T_OUTTAB    = GT_DATA
* EXCEPTIONS
*   PROGRAM_ERROR                     = 1
*   OTHERS      = 2
  .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.