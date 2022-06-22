*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZTOGRENCI.......................................*
DATA:  BEGIN OF STATUS_ZTOGRENCI                     .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZTOGRENCI                     .
CONTROLS: TCTRL_ZTOGRENCI
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZTOGRENCI                     .
TABLES: ZTOGRENCI                      .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
