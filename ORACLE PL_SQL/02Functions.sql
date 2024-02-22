---------------------------------------------------------
CREATE OR REPLACE FUNCTION "IREM"."AGE_CONTROL" (age INT)
return varchar2 as
       str varchar2(30);
begin
  if age >= 18 then
    str := 'You are over 18';
  end if;
  return str;
end;
/
---------------------------------------------------------
CREATE OR REPLACE FUNCTION "IREM"."GECME" (sinif_id INT)
return INT is
       v_harf varchar2(2);
       v_not_bas INT;
       gecmenotu INT(2);
       a INT := 0;
cursor c_harf_notu is
       select hn.harf_notu_adi, hn.harf_notu_bas
       from harf_notlari hn
       where hn.sinif_id = sinif_id
       order by hn.harf_notu_bas DESC;
begin
       open c_harf_notu;
       loop
         fetch c_harf_notu into v_harf, v_not_bas;
         exit when c_harf_notu%NOTFOUND;
         if not v_harf = 'FF' then
           gecmenotu := v_not_bas ;
         end if;
        end loop;
        close c_harf_notu;
return gecmenotu;
end;
/
--------------------------------------------------------
CREATE OR REPLACE FUNCTION "IREM"."GENDER" (gen_id NUMBER)
return VARCHAR2
as
       adi VARCHAR2(100);
begin
  select kisi.Ad_Asc into adi
  from Kisi
  where gen_id = Cinsiyet_Id;
  return adi;
end gender;
/
---------------------------------------------------------
CREATE OR REPLACE FUNCTION "IREM"."HARF_NOT2" (sinif_ogr_id INT)
return varchar2 is
       v_notu varchar2(2);
       v_not_agirlik FLOAT;
       toplam_not FLOAT;
cursor c_harf_notu is
       select na.not_agirlik , sn.notu
       from sinif_not sn, not_tur nt, not_agirlik na
       where sn.sinif_ogrenci_id = sinif_ogr_id
       and sn.not_tur_id = nt.not_tur_id
       and nt.not_tur_id = na.not_tur_id;                  
begin
       toplam_not :=0;
       open c_harf_notu;
       loop
         fetch c_harf_notu into v_not_agirlik, v_notu;    
         exit when c_harf_notu%NOTFOUND;  
         toplam_not := toplam_not + v_not_agirlik*v_notu;
         end loop;
         close c_harf_notu;
return toplam_not;     
end;
/
-----------------------------------------------------------
CREATE OR REPLACE FUNCTION "IREM"."HARF_NOTU" (sinif_id INT, final_notu FLOAT)
return varchar2 is
       v_harf varchar2(2);
       v_not_bas INT;
       harf varchar2(2) := '';
       a INT := 0;
cursor c_harf_notu is
       select hn.harf_notu_adi, hn.harf_notu_bas
       from harf_notlari hn
       where hn.sinif_id = sinif_id
       order by hn.harf_notu_bas ASC;
begin
       open c_harf_notu;
       loop
         fetch c_harf_notu into v_harf, v_not_bas;
         exit when c_harf_notu%NOTFOUND;
         if final_notu >= v_not_bas then
           harf := v_harf;
           a:= a+1;
         end if;
        end loop;
        close c_harf_notu;
return harf;
end;
/
------------------------------------------------------------
CREATE OR REPLACE FUNCTION "IREM"."INCREASE_BY_TEN" (input_num FLOAT)
RETURN FLOAT AS
       results FLOAT;
BEGIN
       results := input_num + 10;
       RETURN results;
END;
/
------------------------------------------------------------
CREATE OR REPLACE FUNCTION "IREM"."QUERY_VAL" ( ogr_id int)
return varchar2 is
       v_ogr_soyad varchar2(30);
       v_ogr_ad varchar2(30);
       v_ogr_no number(9);
       v_param number(1);
cursor c_ogr_bilgi is
       select og.ogrenci_no, k.ad, k.soyad
       from kisi k right join ogrenci og
       on k.kisi_id = og.kisi_id
       where og.ogrenci_id = ogr_id;

cursor c_param is
       select gorunum
       from parametre ;
       
begin
          open c_ogr_bilgi;
          loop
               fetch c_ogr_bilgi into v_ogr_no, v_ogr_ad, v_ogr_soyad;
               exit when c_ogr_bilgi%NOTFOUND;
              /* result := result || v_ogr_no || '-' || v_ogr_bilgi1 || ' ' ||v_ogr_bilgi2 || CHR(10);*/
               /*dbms_output.put_line(v_ogr_id || '-' || v_ogr_bilgi1 || ' ' ||v_ogr_bilgi2);*/

         end loop;
         close c_ogr_bilgi;
         open c_param;
         fetch c_param into v_param;
       /*  exit when c_param%NOTFOUND;*/
         close c_param;
         
         
         
        if v_param = 1 then
          return v_ogr_ad || ' ' || v_ogr_soyad;
        
        else
          return v_ogr_soyad || ' ' || v_ogr_ad;
        end if;

end;
/
---------------------------------------------------------
CREATE OR REPLACE FUNCTION "IREM"."INCREASE_NOTE" (@note INT)
RETURN INT AS
BEGIN
       RETURN
       (@note+10)
END
/
----------------------------------------------------------
CREATE OR REPLACE FUNCTION "IREM"."HARF_NOT" (ogr_id INT)
return varchar2(2) as
       harf_notu varchar2(2);
begin
  create view notlari as
         select sn.sinif_ogrenci_id, nt.not_tur_adi , sn.notu , na.not_agirlik, na.not_agirlik * sn.notu as agirlikli_not
         from sinif_not sn, not_tur nt, not_agirlik na
         where sn.sinif_ogrenci_id = '1'
         and sn.not_tur_id = nt.not_tur_id
         and nt.not_tur_id = na.not_tur_id;
  if select sum(agirlikli_not) > 80 and sum(agirlikli_not) < 90 then
    harf_notu := 'BA';
  end if;
  drop view notlari
    return harf_notu;
end;
/
