-------------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "IREM"."BASARI" ("SINIF_ID", "DERS_ADI", "GECME_NOTU", "SINIF_ORTALAMASI", "OGRENCI_SAYISI", "KALAN_OGRENCI", "GECEN_OGRENCI", "BASARI_ORANI") AS 
  select
        sinif.sinif_id,
        ders.ders_adi,
        gecme(sinif.sinif_id) as gecme_notu,
        avg(v_sinif_sonuc.final_not) as sinif_ortalamasi,
        count(v_sinif_sonuc.harf) as ogrenci_sayisi,
        count(case when v_sinif_sonuc.harf = 'FF' then 1 end) as kalan_ogrenci,
        count(v_sinif_sonuc.harf)-count(case when v_sinif_sonuc.harf = 'FF' then 1 end) as gecen_ogrenci,
        ((count(v_sinif_sonuc.harf)-count(case when v_sinif_sonuc.harf = 'FF' then 1 end))/count(v_sinif_sonuc.harf))*100 || '%' as basari_orani
    from
        v_sinif_sonuc
    join
        sinif on v_sinif_sonuc.sinif_id = sinif.sinif_id
    join
        ders on sinif.ders_id = ders.ders_id
    group by
        sinif.sinif_id,
        ders.ders_adi;
        
-------------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "IREM"."MEN" ("AD_ASC", "SOYAD", "DOGUM_TARIH") AS 
  SELECT Ad_Asc, Soyad, dogum_tarih FROM Kisi
Where Cinsiyet_Id = '2'
ORDER BY Dogum_Tarih
;
-------------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "IREM"."NOTLARI" ("SINIF_OGRENCI_ID", "NOT_TUR_ADI", "NOTU", "NOT_AGIRLIK", "AGIRLIKLI_NOT") AS 
  select sn.sinif_ogrenci_id, nt.not_tur_adi , sn.notu , na.not_agirlik, na.not_agirlik * sn.notu as agirlikli_not from sinif_not sn, not_tur nt, not_agirlik na
         where sn.sinif_ogrenci_id = '1'
         and sn.not_tur_id = nt.not_tur_id
         and nt.not_tur_id = na.not_tur_id
;
--------------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "IREM"."V_SINIF_SONUC" ("SINIF_ID", "DERS_ADI", "AD_ASC", "SOYAD_ASC", "FINAL_NOT", "HARF") AS 
  select
        sinif.sinif_id,
        ders.ders_adi,
        kisi.ad_asc,
        kisi.soyad_asc,
        harf_not2(sinif_ogrenci.sinif_ogrenci_id) as final_not,
        harf_notu(sinif.sinif_id, harf_not2(sinif_ogrenci.sinif_ogrenci_id)) as harf
    from
        kisi
    join
        ogrenci on kisi.kisi_id = ogrenci.kisi_id
    join
        sinif_ogrenci on ogrenci.ogrenci_id = sinif_ogrenci.ogrenci_id
    join
        sinif on sinif_ogrenci.sinif_id = sinif.sinif_id
    join
        ders on sinif.ders_id = ders.ders_id
    join
        harf_notlari on harf_notlari.sinif_id = sinif.sinif_id
    left join
        sinif_not on sinif_not.sinif_ogrenci_id = sinif_ogrenci.sinif_ogrenci_id
    group by
        sinif.sinif_id,
        ders.ders_adi,
        kisi.ad_asc,
        kisi.soyad_asc,
        harf_not2(sinif_ogrenci.sinif_ogrenci_id),
        harf_notu(sinif.sinif_id, harf_not2(sinif_ogrenci.sinif_ogrenci_id))
;
----------------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW "IREM"."WOMEN" ("AD_ASC", "SOYAD") AS 
  SELECT Ad_Asc, Soyad FROM Kisi
Where Cinsiyet_Id = '1'
ORDER BY Ad_Asc
;
