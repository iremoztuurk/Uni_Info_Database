CREATE TABLE Kisi (
       Kisi_ID number(9) not null,
       Isim VARCHAR(20) not null,
       Soyisim VARCHAR(20) not null,
       Dogum_Tarihi DATE not null,
       Cinsiyet_ID number(1) not null,
       Resim BLOB not null,
       KIMLIK_ID VARCHAR(20) not null,
       KIMLIK_TURU_ID number(9) not null,
       UYRUK_ID number(3) not null,
       YAKINI_ID number(9) not null,
       KULLANICI_SIFRE VARCHAR(20) not null,
       CONSTRAINT unique_kimlik_id UNIQUE (Kimlik_ID),
       CONSTRAINT kisi_id_pk PRIMARY KEY(Kisi_ID),
       CONSTRAINT kisi_yakini_id_fk FOREIGN KEY (Yakini_ID) REFERENCES Kisi(Kisi_ID),
       CONSTRAINT uk_kisi_kimlik_turid_kimlik_no unique(kimlik_turu_id,kimlik_id)
        
);
alter table kisi add(
      CONSTRAINT uyruk_id_fk FOREIGN KEY (uyruk_ID) REFERENCES uyruk(uyruk_ID),
      CONSTRAINT kimlik_turu_id_fk FOREIGN KEY (kimlik_turu_ID) REFERENCES kimlik_turu(kimlik_turu_id)
);
alter table kisi add(
      CONSTRAINT kullanici_sifre_uk unique(KULLANICI_SIFRE));
      
create table kimlik_turu (
       kimlik_turu_id number(2) not null,
       kimlik_turu varchar(50) not null,
       constraint kimlik_turu_id_pk primary key(kimlik_turu_id)
);

create table uyruk (
       uyruk_id number(3) not null,
       uyruk varchar(20) not null,
       constraint uyruk_id_pk primary key(uyruk_id)
);

CREATE TABLE Cinsiyet (
       Cinsiyet_ID number(1),
       Cinsiyet varchar(10),
       constraint cinsiyet_pk primary key(cinsiyet_id)
);
create table iletisim_tur (
       iletisim_tur_id number(2) not null,
       iletisim_tur varchar(30) not null,
       constraint iletisim_tur_id_pk primary key(iletisim_tur_id)
);

create table iletisim_sahip_tur (
       iletisim_sahip_tur_id number(1) not null,
       iletisim_sahip_tur varchar(10) not null,
       constraint iletisim_sahip_tur_id_pk primary key(iletisim_sahip_tur_id)
);   
    
create table iletisim (
       iletisim_id number(15) not null,
       iletisim_tur_id number(2) not null,
       iletisim_sahip_tur_id number(1) not null,
       iletisim_bilgisi varchar(300) not null,
       iletisim_sahip_id number(10) not null, --(ACCORDING TO THE TYPE OF THE OWNER OF THE COMMUNICATION INFO IT WILL BE CHANGED)
       constraint iletisim_id_pk primary key(iletisim_id),
       constraint iletisim_tur_id_fk foreign key(iletisim_tur_id) references iletisim_tur(iletisim_tur_id) 
); 

create table birim_tur (
       birim_tur_id number(2) not null,
       birim_tur varchar(50) not null,
       constraint birim_tur_id_pk primary key(birim_tur_id)
);       
create table Birim (
       Birim_id number(5) not null,
       birim_tur_id number(2) not null,
       birim_adi varchar(50) not null,
       ust_birim_id number(5) not null,
       kat number(2) null,
       constraint birim_id_pk primary key(birim_id),
       constraint birim_tur_id_fk foreign key(birim_tur_id) references birim_tur(birim_tur_id),
       constraint ust_birim_id_fk foreign key(ust_birim_id) references birim(birim_id)
);      
create table gorev (
       gorev_id number(3) not null,
       gorev_tur varchar(30) not null,
       constraint gorev_id_pk primary key (gorev_id)
);
create table Calisan (
       Calisan_id number(9) not null,
       kisi_id number(9) not null,
       birim_id number(3) not null,
       gorev_id number(3) not null,
       constraint kisi_id_fk1 foreign key(kisi_id) references kisi(kisi_id),
       constraint birim_id_fk foreign key(birim_id) references birim(birim_id),
       constraint gorev_id_fk foreign key(gorev_id) references gorev(gorev_id),
       constraint calisan_id_pk primary key(calisan_id) 
);      
create table burs (
       burs_id number(1) not null,
       burs_tur varchar(12) not null,
       constraint burs_id_pk primary key(burs_id)
);

CREATE TABLE Ogrenci (
       Ogrenci_ID number(9) not null,
       Kisi_ID number(9) not null,
       Ogrenci_No number(9) not null,
       Birim_id number(3) not null,
       Ogrenci_Basari number(6) not null,
       Calisan_ID number(9) not null,
       Burs_ID number(1) not null,
       CV_Doc blob null,
       Kayit_tarihi date not null,
       sinif_no_id number(1) not null,
       constraint kisi_id_fk2 foreign key(kisi_id) references kisi(kisi_id),
       constraint ogrenci_id_pk primary key(ogrenci_id),
       constraint calisan_id_fk foreign key(calisan_id) references calisan(calisan_id),
       constraint burs_id_fk foreign key(burs_id) references burs(burs_id),
       constraint birim_id_fk2 foreign key(birim_id) references birim(birim_id)
);
create table donem_adi (
       donem_adi_id number(1) not null,
       donem_adi varchar(5) not null,
       constraint donem_adi_id_pk primary key(donem_adi_id)
);
create table donem (
       donem_id number(4) not null,
       yil number(4) not null,
       donem_adi_id varchar(5) not null,
       bas_tarihi date not null,
       bit_tarihi date not null,
       constraint donem_id_pk primary key(donem_id),
       constraint donem_adi_id_fk2 foreign key(donem_adi_id) references donem_adi(donem_adi_id)
);
create table olay (
       olay_id number(3) not null,
       olay varchar(50) not null,
       constraint olay_id_pk primary key(olay_id)
);
       
create table akademik_takvim (
       takvim_id number(4) not null,
       donem_id number(4) not null,
       olay_id number(3) not null,
       tarih date not null,
       constraint takvim_id_pk primary key(takvim_id),
       constraint donem_id_fk4 foreign key(donem_id) references donem(donem_id),
       constraint olay_id_fk foreign key(olay_id) references olay(olay_id),
       constraint olay_tarih_uk unique (tarih,olay_id)
);

create table staj (
       staj_id number(10) not null,
       ogrenci_id number(9) not null,
       firma_adi varchar(60) not null,
       donem_id number(4) not null,
       constraint staj_id_pk primary key(staj_id),
       constraint ogrenci_id_fk foreign key (ogrenci_id) references ogrenci(ogrenci_id),
       constraint donem_id_fk3 foreign key (donem_id) references donem(donem_id)
);
       

create table harc (
       harc_id number(10) not null,
       harc_tarihi date not null,
       harc_miktari number(6) not null,
       donem_id number(4) not null,
       ogrenci_id number(9) not null,
       constraint harc_id_pk primary key(harc_id),
       constraint donem_id_fk foreign key(donem_id) references donem(donem_id),
       constraint ogrenci_id_fk foreign key(ogrenci_id) references ogrenci(ogrenci_id),
);
create table ders (
       ders_id number(3) not null,
       ders_isim varchar(50) not null,
       donem_id number(4) not null,
       birim_id number(5) not null,
       kredi number(2) not null,
       constraint ders_id_pk primary key(ders_id),
       constraint donem_id_fk5 foreign key(donem_id) references donem(donem_id),
       constraint birim_id_fk3 foreign key(birim_id) references birim(birim_id)
);
create table gun (
       gun_id number(1) not null,
       gun varchar(10) not null,
       constraint gun_id_pk primary key(gun_id)
);
create table saat (
       saat_id number(2) not null,
       bas_saat varchar(10) not null,
       bitis_saat varchar(10) not null
       constraint saat_id_pk primary key(saat_id)
);

create table sube (
       sube_id number(10) not null,
       sube_no number(1) not null,
       ders_id number(3) not null,
       calisan_id number(9) not null,
       constraint sube_id_pk primary key(sube_id),
       constraint ders_id_fk foreign key(ders_id) references ders(ders_id),
       constraint ders_sube_uk unique(ders_id,sube_no)
); 

create table kayit (
       kayit_id number(10) not null,
       ogrenci_id number(9) not null,
       sube_id number(10) not null,
       constraint kayit_id_pk primary key(kayit_id),
       constraint ogrenci_id_fk3 foreign key(ogrenci_id) references ogrenci(ogrenci_id),
       constraint sube_id_fk3 foreign key(ogrenci_id) references ogrenci(ogrenci_id)
);

create table harf_notu (
       harf_notu_id number(2) not null,
       harf_notu_isim varchar(2) not null,
       not_baslangic number(2) not null,
       sube_id number(10) not null,
       constraint harf_notu_id_pk primary key(harf_notu_id),
       constraint sube_id_fk4 foreign key(sube_id) references sube(sube_id),
       constraint sube_harf_notu_isim_uk unique(sube_id,harf_notu_isim)
);
create table not_tur (
       not_tur_id number(2) not null,
       not_turu varchar(20) not null,
       constraint not_tur_id_pk primary key(not_tur_id)
);
       

create table not_agirlik (
       not_agirlik_id number(5) not null,
       not_tur_id number(2) not null,
       not_agirligi number(2) not null,
       sube_id number(10) not null,
       constraint not_agirlik_id_pk primary key(not_agirlik_id),
       constraint not_tur_id_fk foreign key(not_tur_id) references not_tur(not_tur_id),
       constraint sube_id_fk5 foreign key(sube_id) references sube(sube_id)
);

alter table not_agirlik add(
      constraint sube_not_tur_uk unique(sube_id,not_tur_id)
);

create table ders_notu (
       ders_notu_id number(10) not null,
       kayit_id number(10) not null,
       notu number(3) not null,
       not_tur_id number(2) not null,
       tarih date not null,
       constraint ders_notu_id_pk primary key(ders_notu_id),
       constraint kayit_id_fk2 foreign key(kayit_id) references kayit(kayit_id),
       constraint not_tur_id_fk2 foreign key(not_tur_id) references not_tur(not_tur_id)
);

/*--SEQUENCES FOR PRIMARY KEYS

--KISI
create sequence SEQ_KISI_ID
minvalue 1
maxvalue 99999999
start with 1
increment by 1
cache 20

--KIMLIK TURU
create sequence SEQ_KIMLIK_TURU_ID
minvalue 1
maxvalue 99
start with 1
increment by 1
cache 20

--UYRUK
create sequence SEQ_UYRUK_ID
minvalue 1
maxvalue 999
start with 1
increment by 1
cache 20

--CINSIYET
create sequence SEQ_CINSIYET_ID
minvalue 1
maxvalue 9
start with 1
increment by 1
cache 5

--ILETISIM TUR
create sequence SEQ_ILETISIM_TUR_ID
minvalue 1
maxvalue 99
start with 1
increment by 1
cache 20

--ILETISIM SAHIP TUR
create sequence SEQ_ILETISIM_SAHIP_TUR_ID
minvalue 1
maxvalue 9
start with 1
increment by 1
cache 5

--ILETISIM
create sequence SEQ_ILETISIM_ID
minvalue 1
maxvalue 999999999999999
start with 1
increment by 1
cache 20

--BIRIM TUR
create sequence SEQ_BIRIM_TUR_ID
minvalue 1
maxvalue 99
start with 1
increment by 1
cache 20

--BIRIM
create sequence SEQ_BIRIM_ID
minvalue 1
maxvalue 99999
start with 1
increment by 1
cache 20

--GOREV
create sequence SEQ_GOREV_ID
minvalue 1
maxvalue 999
start with 1
increment by 1
cache 20

--CALISAN
create sequence SEQ_CALISAN_ID
minvalue 1
maxvalue 999999999
start with 1
increment by 1
cache 20

--BURS
create sequence SEQ_BURS_ID
minvalue 1
maxvalue 9
start with 1
increment by 1
cache 5

--OGRENCI
create sequence SEQ_OGRENCI_ID
minvalue 1
maxvalue 999999999
start with 1
increment by 1
cache 20

--DONEM ADI
create sequence SEQ_DONEM_ADI_ID
minvalue 1
maxvalue 9
start with 1
increment by 1
cache 5

--DONEM
create sequence SEQ_DONEM_ID
minvalue 1
maxvalue 9999
start with 1
increment by 1
cache 20

--OLAY
create sequence SEQ_OLAY_ID
minvalue 1
maxvalue 999
start with 1
increment by 1
cache 20

--AKADEMIK TAKVIM
create sequence SEQ_TAKVIM_ID
minvalue 1
maxvalue 9999
start with 1
increment by 1
cache 20

--STAJ
create sequence SEQ_STAJ_ID
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20

--HARC
create sequence SEQ_HARC_ID
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20

--DERS
create sequence SEQ_DERS_ID
minvalue 1
maxvalue 999
start with 1
increment by 1
cache 20

--GUN
create sequence SEQ_GUN_ID
minvalue 1
maxvalue 9
start with 1
increment by 1
cache 5

--SAAT
create sequence SEQ_SAAT_ID
minvalue 1
maxvalue 99
start with 1
increment by 1
cache 20

--SUBE
create sequence SEQ_SUBE_ID
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20

--KAYIT
create sequence SEQ_KAYIT_ID
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20

--HARF NOTU
create sequence SEQ_HARF_NOTU_ID
minvalue 1
maxvalue 99
start with 1
increment by 1
cache 20

--NOT TURU
create sequence SEQ_NOT_TUR_ID
minvalue 1
maxvalue 99
start with 1
increment by 1
cache 20

--NOT AGIRLIK
create sequence SEQ_NOT_AGIRLIK_ID
minvalue 1
maxvalue 99999
start with 1
increment by 1
cache 20

--DERS NOTU
create sequence SEQ_DERS_NOTU_ID
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20

*/










