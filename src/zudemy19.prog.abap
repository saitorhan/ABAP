*&---------------------------------------------------------------------*
*& Report ZUDEMY19
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY19.


*  ---------------------------------------------------------------------------------------*
*   S  : Başarı Mesajı        :  Programın başarı ile bütün işlemleri tamamlamlaması sonucunda bu mesaj verdirilir.
*   I  : Bilgi Mesajı         :  Bilgi amaçlı mesajlar verdirilir. Entera basılarak devam edilebilir. Program çalışmaya devam eder.
*   E  : Hata Mesajı          :  Programın akışını durdurur. Hata mesajı verildiği yerde exit komutuda otomatik olarak çalıştırarak programı sonlandırır.
*   W  : Uyarı Mesajı         :  Hata mesajına benzer yapıdadır. Hata niteliğinde önemli uyarıları vermek için kullanılır. Program çalışmaya devam etmez!
*   A  : Olağan olmayan Mesaj :  Hata detaylarının çok net belli olmadığı durumlarda bu mesaj verdilir. Program çalışmaya devam etmez.
*   X  : Short Dump Mesajı    :  Hatalı yer hakkında detaylı olarak mesajların yazılabileceği short dump hata ekranına yönlendirilir. Programı sonlandırır.
*  ---------------------------------------------------------------------------------------*

PARAMETERS: P_METIN TYPE STRING.

START-OF-SELECTION.
  IF P_METIN IS INITIAL.
"    MESSAGE 'Metin boş geçilemez.' TYPE 'S' DISPLAY LIKE 'W'.
    MESSAGE s000(ZMUDEMY01) DISPLAY LIKE 'W'.
    LEAVE LIST-PROCESSING.
  ENDIF.

END-OF-SELECTION.



  DATA: GV_UZUNLUK TYPE I.

  GV_UZUNLUK = STRLEN( P_METIN ).

  WRITE: 'Metin uzunluğu: ', GV_UZUNLUK.
  MESSAGE s002(ZMUDEMY01) WITH GV_UZUNLUK P_METIN.
  SKIP 1.

  WHILE P_METIN NE SPACE.
    WRITE: SY-INDEX, '. Karakter: ', P_METIN(1).
    NEW-LINE.
    SHIFT P_METIN.
  ENDWHILE.

  "MESSAGE 'İşlem başarılı bir şekilde tamamlandı.' TYPE 'S' DISPLAY LIKE 'I'.
 " MESSAGE s001(ZMUDEMY01).

"MESSAGE ID 'ZMUDEMY01' TYPE 'S' NUMBER 001 DISPLAY LIKE 'W'.
