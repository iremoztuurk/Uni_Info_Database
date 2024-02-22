CREATE OR REPLACE PROCEDURE "IREM"."LASTVAL" (
       p_tablo_adi in varchar2,
       p_field_name in varchar2,
       row_num out number)
is
       v_tablo_adi varchar(20);
       v_field_name varchar(20);
       v_last_val int;

       cursor c_lastval is
              select s.tablo_adi, s.field_name, s.last_val
              from seq s;
begin
       open c_lastval;
       loop
         fetch c_lastval into v_tablo_adi, v_field_name, v_last_val;
         exit when c_lastval%NOTFOUND;
         if p_tablo_adi = v_tablo_adi then
            row_num := v_last_val;
         end if;
        end loop;
        close c_lastval;
end;
/
------------------------------------------------------------
CREATE OR REPLACE PROCEDURE "IREM"."QUERY_VAL2" (input INT) is
       v_ogr_bilgi1 varchar2(30);
       v_ogr_bilgi2 varchar2(30);
       v_ogr_id number(9);

cursor c_ogr_bilgi is
       select og.ogrenci_id, k.ad, k.soyad
       from kisi k right join ogrenci og
       on k.kisi_id = og.kisi_id;
begin
       if input = "1" then
          open c_ogr_bilgi;
          loop
               fetch c_ogr_bilgi into v_ogr_id, v_ogr_bilgi1 , v_ogr_bilgi2;
               exit when c_ogr_bilgi%NOTFOUND;
               /*result := result || v_ogr_id || '-' || v_ogr_bilgi1 || ' ' ||v_ogr_bilgi2 || CHR(10);*/
               dbms_output.put_line(v_ogr_id || '-' || v_ogr_bilgi1 || ' ' ||v_ogr_bilgi2);

         end loop;
         close c_ogr_bilgi;

       elsif input = "2" then
          open c_ogr_bilgi;
          loop
               fetch c_ogr_bilgi into v_ogr_id, v_ogr_bilgi2 , v_ogr_bilgi1;
               exit when c_ogr_bilgi%NOTFOUND;
               /*result := result|| v_ogr_id || '-' || v_ogr_bilgi1 || ' ' ||v_ogr_bilgi2 || CHR(10);*/
               dbms_output.put_line(v_ogr_id || '-' || v_ogr_bilgi1 || ' ' ||v_ogr_bilgi2);
         end loop;
         close c_ogr_bilgi;
end;
/
