*&---------------------------------------------------------------------*
*& Report ZALV_LIST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY33.

PARAMETERS: P_DATE TYPE S_BDATE.

DATA: GT_DATA TYPE ZTBOOK,
      GS_DATA TYPE ZSBOOK.

data: layot TYPE SLIS_LAYOUT_ALV.

SELECT * FROM SBOOK AS SB
  JOIN SCARR AS SR ON SB~CARRID EQ SR~CARRID
  JOIN SPFLI AS SF ON SB~CONNID EQ SF~CONNID AND SB~CARRID EQ SF~CARRID
  INTO CORRESPONDING FIELDS OF TABLE GT_DATA
  WHERE SB~ORDER_DATE = P_DATE.

  LAYOT-ZEBRA = 'X'.
  LAYOT-COLWIDTH_OPTIMIZE = 'X'.

CALL FUNCTION 'REUSE_ALV_LIST_DISPLAY'
 EXPORTING
*   I_INTERFACE_CHECK              = ' '
*   I_BYPASSING_BUFFER             =
*   I_BUFFER_ACTIVE                = ' '
*   I_CALLBACK_PROGRAM             = ' '
*   I_CALLBACK_PF_STATUS_SET       = ' '
*   I_CALLBACK_USER_COMMAND        = ' '
   I_STRUCTURE_NAME               = 'ZSBOOK'
   IS_LAYOUT                      = LAYOT
*   IT_FIELDCAT                    =
*   IT_EXCLUDING                   =
*   IT_SPECIAL_GROUPS              =
*   IT_SORT                        =
*   IT_FILTER                      =
*   IS_SEL_HIDE                    =
*   I_DEFAULT                      = 'X'
*   I_SAVE                         = ' '
*   IS_VARIANT                     =
*   IT_EVENTS                      =
*   IT_EVENT_EXIT                  =
*   IS_PRINT                       =
*   IS_REPREP_ID                   =
*   I_SCREEN_START_COLUMN          = 0
*   I_SCREEN_START_LINE            = 0
*   I_SCREEN_END_COLUMN            = 0
*   I_SCREEN_END_LINE              = 0
*   IR_SALV_LIST_ADAPTER           =
*   IT_EXCEPT_QINFO                =
*   I_SUPPRESS_EMPTY_DATA          = ABAP_FALSE
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER        =
*   ES_EXIT_CAUSED_BY_USER         =
  TABLES
    T_OUTTAB                       = GT_DATA
* EXCEPTIONS
*   PROGRAM_ERROR                  = 1
*   OTHERS                         = 2
          .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.
