*&---------------------------------------------------------------------*
*& Report ZUDEMY06
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZUDEMY06.

data: gs_ogr TYPE ZOGRENCI.

PARAMETERS:
p_AD LIKE GS_OGR-AD,
p_SOYAD TYPE ZSOYAD,
p_DTARIH LIKE GS_OGR-DTARIH,
p_CNSYT  LIKE GS_OGR-CINSIYET,
p_HARC LIKE GS_OGR-HARC,
p_PBIRIM LIKE GS_OGR-PBIRIM,
p_YAS LIKE GS_OGR-YAS,
p_BIRIM LIKE GS_OGR-BIRIM,
p_bolum type ZBOLUM.

WRITE :
'Adı:', p_AD,
/'Soyadı:' , p_SOYAD ,
/'Doğum Tarihi:' , p_DTARIH,
/'Cinsiyet:' , p_CNSYT ,
/'Harç Miktarı:' , p_HARC, p_PBIRIM,
/'Yaşı' , p_YAS , p_BIRIM ,
/'Bölümü:', P_BOLUM.


PERFORM selam(zudemy05).
PERFORM selam IN PROGRAM zudemy05.
